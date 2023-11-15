<?php
/**
Copyright 2012-2017 Nick Korbel

This file is part of Booked Scheduler.

Booked Scheduler is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

Booked Scheduler is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Booked Scheduler.  If not, see <http://www.gnu.org/licenses/>.
 */

require_once(ROOT_DIR . 'lib/Application/Reporting/namespace.php');
require_once(ROOT_DIR . 'Domain/Access/namespace.php');

class ReportingServiceTests extends TestBase
{
	/**
	 * @var ReportingService
	 */
	private $rs;

	/**
	 * @var IReportingRepository|PHPUnit_Framework_MockObject_MockObject
	 */
	private $reportingRepository;

	public function setup()
	{
		parent::setup();

		$this->reportingRepository = $this->getMock('IReportingRepository');

		$this->rs = new ReportingService($this->reportingRepository);
	}

	public function testBuildsCustomResourceReport()
	{
		$start = '2010-01-01';
		$end = '2010-01-02';

		$resourceId = array(1);
		$scheduleId = array(2);
		$userId = 3;
		$groupId = array(4);
		$accessoryId = array(5);
		$participantId = 6;
		$resourceTypeId = array(7);

		$usage = new Report_Usage(Report_Usage::RESOURCES);
		$selection = new Report_ResultSelection(Report_ResultSelection::FULL_LIST);
		$groupBy = new Report_GroupBy(Report_GroupBy::GROUP);
		$range = new Report_Range(Report_Range::DATE_RANGE, $start, $end, 'UTC');
		$filter = new Report_Filter($resourceId, $scheduleId, $userId, $groupId, $accessoryId, $participantId, true, $resourceTypeId);

		$commandBuilder = new ReportCommandBuilder();
		$commandBuilder->SelectFullList()
				->OfResources()
				->Within(Date::Parse($start, 'UTC'), Date::Parse($end, 'UTC'))
				->WithResourceIds($resourceId)
				->WithUserId($userId)
				->WithParticipantId($participantId)
				->WithScheduleIds($scheduleId)
				->WithGroupIds($groupId)
				->WithAccessoryIds($accessoryId)
				->WithResourceTypeIds($resourceTypeId)
				->WithDeleted()
				->GroupByGroup();

		$rows = array(array(
						  ColumnNames::OWNER_FIRST_NAME => 'value',
						  ColumnNames::OWNER_LAST_NAME => 'value',
						  ColumnNames::OWNER_USER_ID => 'value',
					  ));

		$this->reportingRepository->expects($this->once())
				->method('GetCustomReport')
				->with($this->equalTo($commandBuilder))
				->will($this->returnValue($rows));

		$report = $this->rs->GenerateCustomReport($usage, $selection, $groupBy, $range, $filter);

		$cols = new ReportColumns();
		$cols->Add(ColumnNames::OWNER_FIRST_NAME);
		$cols->Add(ColumnNames::OWNER_LAST_NAME);
		$cols->Add(ColumnNames::OWNER_USER_ID);

		$this->assertEquals($cols, $report->GetColumns());
		$this->assertEquals(new CustomReportData($rows), $report->GetData());
	}

	public function testSavesReportForUser()
	{
		$reportName = 'reportName';
		$userId = 12;

		$usage = new Report_Usage(Report_Usage::ACCESSORIES);
		$selection = new Report_ResultSelection(Report_ResultSelection::COUNT);
		$groupBy = new Report_GroupBy(Report_GroupBy::RESOURCE);
		$range = new Report_Range(Report_Range::ALL_TIME, Date::Now(), Date::Now());
		$filter = new Report_Filter(null, null, null, null, null, null, null, null);

		$savedReport = new SavedReport($reportName, $userId, $usage, $selection, $groupBy, $range, $filter);

		$this->reportingRepository->expects($this->once())
				->method('SaveCustomReport')
				->with($this->equalTo($savedReport));

		$this->rs->Save($reportName, $userId, $usage, $selection, $groupBy, $range, $filter);
	}

	public function testGetsSavedReports()
	{
		$reports = array();
		$userId = 100;

		$this->reportingRepository->expects($this->once())
				->method('LoadSavedReportsForUser')
				->with($this->equalTo($userId))
				->will($this->returnValue($reports));

		$actualReports = $this->rs->GetSavedReports($userId);

		$this->assertEquals($reports, $actualReports);
	}

	public function testGeneratesSavedReport()
	{
		$reportId = 1;
		$userId = 2;

		$savedReport = new FakeSavedReport();
		$data = array();
		$report = new CustomReport($data, new FakeAttributeRepository());

		$this->reportingRepository->expects($this->once())
				->method('LoadSavedReportForUser')
				->with($this->equalTo($reportId), $this->equalTo($userId))
				->will($this->returnValue($savedReport));

		$this->reportingRepository->expects($this->once())
				->method('GetCustomReport')
				->with($this->isInstanceOf('ReportCommandBuilder'))
				->will($this->returnValue($data));

		$expectedReport = new GeneratedSavedReport($savedReport, $report);
		$actualReport = $this->rs->GenerateSavedReport($reportId, $userId);

		$this->assertEquals($expectedReport, $actualReport);
	}

	public function testEmailsReport()
	{
		$report = new GeneratedSavedReport(new FakeSavedReport(), new FakeReport());
		$def = new ReportDefinition($report, null);
		$to = 'email';
		$user = $this->fakeUser;

		$cols = 'cols';

		$expectedMessage = new ReportEmailMessage($report, $def, $to, $user, $cols);

		$this->rs->SendReport($report, $def, $to, $user, $cols);
		$this->assertInstanceOf('ReportEmailMessage', $this->fakeEmailService->_LastMessage);
	}

	public function testDeletesReport()
	{
		$reportId = 1;
		$userId = 2;

		$this->reportingRepository->expects($this->once())
				->method('DeleteSavedReport')
				->with($this->equalTo($reportId), $this->equalTo($userId));

		$this->rs->DeleteSavedReport($reportId, $userId);
	}
}
