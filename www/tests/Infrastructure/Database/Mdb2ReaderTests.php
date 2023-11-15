<?php
/**
Copyright 2011-2017 Nick Korbel

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

require_once(ROOT_DIR . 'lib/Database/Mdb2/namespace.php');

class Mdb2ReaderTests extends PHPUnit_Framework_TestCase
{
	var $fakeDb;
	var $fakeResult;
	var $cn;
	var $fakeHandle;

	function setUp() {
        $this->cn = new Mdb2Connection(null, null, null, null, null);
		$empty = array();
        $this->fakeResult = new FakeDBResult($empty);
		$this->fakeDb = new FakePearDB($this->fakeResult);
		$this->fakeHandle = new FakePrepareHandle($this->fakeResult);
		$this->fakeDb->PrepareHandle =& $this->fakeHandle;
		$this->cn->SetDb($this->fakeDb);
    }

	function tearDown() {
		$this->cn = null;
		$this->fakeResult = null;
		$this->fakeHandle = null;
		$this->fakeDb->PrepareHandle = null;
		$this->fakeDb = null;
	}

    function testReaderGetRowGetsArrayWhenItHasResults() {
		$rows = $this->createResultRows();
    	$result = new FakeDBResult($rows);
		$reader = new Mdb2Reader($result);

		$row = $reader->getRow();

		$this->assertEquals('1a', $row['col 1'], 'Row value is not equal');
		$this->assertEquals('2a', $row['col 2'], 'Row value is not equal');
		$this->assertEquals('3a', $row['col 3'], 'Row value is not equal');

		$row = $reader->getRow();
		$this->assertEquals('1b', $row['col 1'], 'Row value is not equal');
		$this->assertEquals('2b', $row['col 2'], 'Row value is not equal');
		$this->assertEquals('3b', $row['col 3'], 'Row value is not equal');

		$row = $reader->getRow();
		$this->assertFalse($row, 'Row should be false');
	}

	function testDatabseReaderNumRowsReturnsCorrectNumberOfRows() {
		$rows = $this->createResultRows();
		$result = new FakeDBResult($rows);
		$reader = new Mdb2Reader($result);

		$this->assertEquals(2, $reader->numRows(), 'Number of rows in reader is not correct');
	}

	function testDatabaseQueryReturnsValidReader() {
		$cn = new Mdb2Connection(null, null, null, null, null);
		$rows = $this->createResultRows();
		$result = new FakeDBResult($rows);
		$_db = new FakePearDB($result);
		$_db->PrepareHandle = new FakePrepareHandle($result);
		$cn->SetDb($_db);

		$command = new SqlCommand();
		$reader = $cn->Query($command);

		$row = $reader->getRow();

		$this->assertEquals('1a', $row['col 1'], 'Row value is not equal');
		$this->assertEquals('2a', $row['col 2'], 'Row value is not equal');
		$this->assertEquals('3a', $row['col 3'], 'Row value is not equal');

		$row = $reader->getRow();
		$this->assertEquals('1b', $row['col 1'], 'Row value is not equal');
		$this->assertEquals('2b', $row['col 2'], 'Row value is not equal');
		$this->assertEquals('3b', $row['col 3'], 'Row value is not equal');

		$row = $reader->getRow();
		$this->assertFalse($row, 'Row should be false');
	}

	function createResultRows() {
		$rows = array();
		$rows[] = array('col 1' => '1a', 'col 2' => '2a', 'col 3' => '3a');
		$rows[] = array('col 1' => '1b', 'col 2' => '2b', 'col 3' => '3b');
		return $rows;
	}
}
?>