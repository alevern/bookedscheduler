-- MySQL dump 10.19  Distrib 10.3.36-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: booked
-- ------------------------------------------------------
-- Server version	10.3.36-MariaDB-1:10.3.36+maria~ubu2004

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accessories` (
  `accessory_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `accessory_name` varchar(85) NOT NULL,
  `accessory_quantity` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  PRIMARY KEY (`accessory_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
INSERT INTO `accessories` VALUES (1,'accessory limited to 10',10,NULL),(2,'accessory limited to 2',2,NULL),(3,'unlimited accessory',NULL,NULL);
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_activation`
--

DROP TABLE IF EXISTS `account_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account_activation` (
  `account_activation_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `activation_code` varchar(30) NOT NULL,
  `date_created` datetime NOT NULL,
  PRIMARY KEY (`account_activation_id`),
  UNIQUE KEY `activation_code_2` (`activation_code`),
  KEY `activation_code` (`activation_code`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `account_activation_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_activation`
--

LOCK TABLES `account_activation` WRITE;
/*!40000 ALTER TABLE `account_activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_groups`
--

DROP TABLE IF EXISTS `announcement_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_groups` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`group_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `announcement_groups_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_groups`
--

LOCK TABLES `announcement_groups` WRITE;
/*!40000 ALTER TABLE `announcement_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement_resources`
--

DROP TABLE IF EXISTS `announcement_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcement_resources` (
  `announcementid` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`announcementid`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `announcement_resources_ibfk_1` FOREIGN KEY (`announcementid`) REFERENCES `announcements` (`announcementid`) ON DELETE CASCADE,
  CONSTRAINT `announcement_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement_resources`
--

LOCK TABLES `announcement_resources` WRITE;
/*!40000 ALTER TABLE `announcement_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `announcementid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `announcement_text` text NOT NULL,
  `priority` mediumint(8) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`announcementid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_instances`
--

DROP TABLE IF EXISTS `blackout_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_instances` (
  `blackout_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `blackout_series_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`blackout_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `blackout_series_id` (`blackout_series_id`),
  CONSTRAINT `blackout_instances_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_instances`
--

LOCK TABLES `blackout_instances` WRITE;
/*!40000 ALTER TABLE `blackout_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series`
--

DROP TABLE IF EXISTS `blackout_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series` (
  `blackout_series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text DEFAULT NULL,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`blackout_series_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series`
--

LOCK TABLES `blackout_series` WRITE;
/*!40000 ALTER TABLE `blackout_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blackout_series_resources`
--

DROP TABLE IF EXISTS `blackout_series_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blackout_series_resources` (
  `blackout_series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`blackout_series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `blackout_series_resources_ibfk_1` FOREIGN KEY (`blackout_series_id`) REFERENCES `blackout_series` (`blackout_series_id`) ON DELETE CASCADE,
  CONSTRAINT `blackout_series_resources_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blackout_series_resources`
--

LOCK TABLES `blackout_series_resources` WRITE;
/*!40000 ALTER TABLE `blackout_series_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `blackout_series_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_entities`
--

DROP TABLE IF EXISTS `custom_attribute_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_entities` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_id`,`entity_id`),
  CONSTRAINT `custom_attribute_entities_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_entities`
--

LOCK TABLES `custom_attribute_entities` WRITE;
/*!40000 ALTER TABLE `custom_attribute_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_attribute_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attribute_values`
--

DROP TABLE IF EXISTS `custom_attribute_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attribute_values` (
  `custom_attribute_value_id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned NOT NULL,
  `attribute_value` text NOT NULL,
  `entity_id` mediumint(8) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`custom_attribute_value_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  KEY `entity_category` (`entity_id`,`attribute_category`),
  KEY `entity_attribute` (`entity_id`,`custom_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attribute_values`
--

LOCK TABLES `custom_attribute_values` WRITE;
/*!40000 ALTER TABLE `custom_attribute_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_attribute_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_attributes`
--

DROP TABLE IF EXISTS `custom_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `custom_attributes` (
  `custom_attribute_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `display_label` varchar(50) NOT NULL,
  `display_type` tinyint(2) unsigned NOT NULL,
  `attribute_category` tinyint(2) unsigned NOT NULL,
  `validation_regex` varchar(50) DEFAULT NULL,
  `is_required` tinyint(1) unsigned NOT NULL,
  `possible_values` text DEFAULT NULL,
  `sort_order` tinyint(2) unsigned DEFAULT NULL,
  `admin_only` tinyint(1) unsigned DEFAULT NULL,
  `secondary_category` tinyint(2) unsigned DEFAULT NULL,
  `secondary_entity_ids` varchar(2000) DEFAULT NULL,
  `is_private` tinyint(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`custom_attribute_id`),
  KEY `attribute_category` (`attribute_category`),
  KEY `display_label` (`display_label`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_attributes`
--

LOCK TABLES `custom_attributes` WRITE;
/*!40000 ALTER TABLE `custom_attributes` DISABLE KEYS */;
INSERT INTO `custom_attributes` VALUES (1,'Test Number',1,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Test String',1,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Test Number',1,4,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Test String',1,4,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `custom_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dbversion`
--

DROP TABLE IF EXISTS `dbversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dbversion` (
  `version_number` double unsigned NOT NULL DEFAULT 0,
  `version_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dbversion`
--

LOCK TABLES `dbversion` WRITE;
/*!40000 ALTER TABLE `dbversion` DISABLE KEYS */;
INSERT INTO `dbversion` VALUES (2.1,'2022-09-20 09:34:35'),(2.2,'2022-09-20 09:34:43'),(2.3,'2022-09-20 09:34:53'),(2.4,'2022-09-20 09:35:00'),(2.5,'2022-09-20 09:35:09'),(2.6,'2022-09-20 09:35:19');
/*!40000 ALTER TABLE `dbversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_resource_permissions`
--

DROP TABLE IF EXISTS `group_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_resource_permissions` (
  `group_id` smallint(5) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `group_resource_permissions_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_resource_permissions`
--

LOCK TABLES `group_resource_permissions` WRITE;
/*!40000 ALTER TABLE `group_resource_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `group_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_roles`
--

DROP TABLE IF EXISTS `group_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_roles` (
  `group_id` smallint(8) unsigned NOT NULL,
  `role_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`role_id`),
  KEY `group_id` (`group_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `group_roles_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `group_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_roles`
--

LOCK TABLES `group_roles` WRITE;
/*!40000 ALTER TABLE `group_roles` DISABLE KEYS */;
INSERT INTO `group_roles` VALUES (1,1),(2,2),(4,4);
/*!40000 ALTER TABLE `group_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `group_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `legacyid` char(16) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  KEY `admin_group_id` (`admin_group_id`),
  CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'Group Administrators',NULL,NULL),(2,'Application Administrators',NULL,NULL),(3,'Resource Administrators',NULL,NULL),(4,'Schedule Administrators',NULL,NULL);
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `layouts`
--

DROP TABLE IF EXISTS `layouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `layouts` (
  `layout_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `timezone` varchar(50) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `layouts`
--

LOCK TABLES `layouts` WRITE;
/*!40000 ALTER TABLE `layouts` DISABLE KEYS */;
INSERT INTO `layouts` VALUES (1,'America/Chicago');
/*!40000 ALTER TABLE `layouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peak_times`
--

DROP TABLE IF EXISTS `peak_times`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `peak_times` (
  `peak_times_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `all_day` tinyint(1) unsigned NOT NULL,
  `start_time` varchar(10) DEFAULT NULL,
  `end_time` varchar(10) DEFAULT NULL,
  `every_day` tinyint(1) unsigned NOT NULL,
  `peak_days` varchar(13) DEFAULT NULL,
  `all_year` tinyint(1) unsigned NOT NULL,
  `begin_month` tinyint(1) unsigned NOT NULL,
  `begin_day` tinyint(1) unsigned NOT NULL,
  `end_month` tinyint(1) unsigned NOT NULL,
  `end_day` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`peak_times_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `peak_times_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peak_times`
--

LOCK TABLES `peak_times` WRITE;
/*!40000 ALTER TABLE `peak_times` DISABLE KEYS */;
/*!40000 ALTER TABLE `peak_times` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotas`
--

DROP TABLE IF EXISTS `quotas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotas` (
  `quota_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `quota_limit` decimal(7,2) unsigned NOT NULL,
  `unit` varchar(25) NOT NULL,
  `duration` varchar(25) NOT NULL,
  `resource_id` smallint(5) unsigned DEFAULT NULL,
  `group_id` smallint(5) unsigned DEFAULT NULL,
  `schedule_id` smallint(5) unsigned DEFAULT NULL,
  `enforced_days` varchar(15) DEFAULT NULL,
  `enforced_time_start` time DEFAULT NULL,
  `enforced_time_end` time DEFAULT NULL,
  `scope` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`quota_id`),
  KEY `resource_id` (`resource_id`),
  KEY `group_id` (`group_id`),
  KEY `schedule_id` (`schedule_id`),
  CONSTRAINT `quotas_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `quotas_ibfk_3` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotas`
--

LOCK TABLES `quotas` WRITE;
/*!40000 ALTER TABLE `quotas` DISABLE KEYS */;
/*!40000 ALTER TABLE `quotas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reminders`
--

DROP TABLE IF EXISTS `reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `address` text NOT NULL,
  `message` text NOT NULL,
  `sendtime` datetime NOT NULL,
  `refnumber` text NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `reminders_user_id` (`user_id`),
  CONSTRAINT `reminders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reminders`
--

LOCK TABLES `reminders` WRITE;
/*!40000 ALTER TABLE `reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_accessories`
--

DROP TABLE IF EXISTS `reservation_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_accessories` (
  `series_id` int(10) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `quantity` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`series_id`,`accessory_id`),
  KEY `accessory_id` (`accessory_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_accessories_ibfk_1` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_accessories_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_accessories`
--

LOCK TABLES `reservation_accessories` WRITE;
/*!40000 ALTER TABLE `reservation_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_color_rules`
--

DROP TABLE IF EXISTS `reservation_color_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_color_rules` (
  `reservation_color_rule_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `custom_attribute_id` mediumint(8) unsigned DEFAULT NULL,
  `attribute_type` smallint(5) unsigned DEFAULT NULL,
  `required_value` text DEFAULT NULL,
  `comparison_type` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`reservation_color_rule_id`),
  KEY `custom_attribute_id` (`custom_attribute_id`),
  CONSTRAINT `reservation_color_rules_ibfk_1` FOREIGN KEY (`custom_attribute_id`) REFERENCES `custom_attributes` (`custom_attribute_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_color_rules`
--

LOCK TABLES `reservation_color_rules` WRITE;
/*!40000 ALTER TABLE `reservation_color_rules` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_color_rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_files`
--

DROP TABLE IF EXISTS `reservation_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_files` (
  `file_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `file_name` varchar(250) NOT NULL,
  `file_type` varchar(75) DEFAULT NULL,
  `file_size` varchar(45) NOT NULL,
  `file_extension` varchar(10) NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_files_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_files`
--

LOCK TABLES `reservation_files` WRITE;
/*!40000 ALTER TABLE `reservation_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_guests`
--

DROP TABLE IF EXISTS `reservation_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_guests` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `email` varchar(255) NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`email`),
  KEY `reservation_guests_reservation_instance_id` (`reservation_instance_id`),
  KEY `reservation_guests_email_address` (`email`),
  KEY `reservation_guests_reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_guests_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_guests`
--

LOCK TABLES `reservation_guests` WRITE;
/*!40000 ALTER TABLE `reservation_guests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_instances`
--

DROP TABLE IF EXISTS `reservation_instances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_instances` (
  `reservation_instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `reference_number` varchar(50) NOT NULL,
  `series_id` int(10) unsigned NOT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `checkout_date` datetime DEFAULT NULL,
  `previous_end_date` datetime DEFAULT NULL,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`reservation_instance_id`),
  KEY `start_date` (`start_date`),
  KEY `end_date` (`end_date`),
  KEY `reference_number` (`reference_number`),
  KEY `series_id` (`series_id`),
  KEY `checkin_date` (`checkin_date`),
  CONSTRAINT `reservations_series` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_instances`
--

LOCK TABLES `reservation_instances` WRITE;
/*!40000 ALTER TABLE `reservation_instances` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_instances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_reminders`
--

DROP TABLE IF EXISTS `reservation_reminders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_reminders` (
  `reminder_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `series_id` int(10) unsigned NOT NULL,
  `minutes_prior` int(10) unsigned NOT NULL,
  `reminder_type` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reminder_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_reminders_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_reminders`
--

LOCK TABLES `reservation_reminders` WRITE;
/*!40000 ALTER TABLE `reservation_reminders` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_reminders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_resources`
--

DROP TABLE IF EXISTS `reservation_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_resources` (
  `series_id` int(10) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_level_id` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`series_id`,`resource_id`),
  KEY `resource_id` (`resource_id`),
  KEY `series_id` (`series_id`),
  CONSTRAINT `reservation_resources_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_resources_ibfk_2` FOREIGN KEY (`series_id`) REFERENCES `reservation_series` (`series_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_resources`
--

LOCK TABLES `reservation_resources` WRITE;
/*!40000 ALTER TABLE `reservation_resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_series`
--

DROP TABLE IF EXISTS `reservation_series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_series` (
  `series_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date_created` datetime NOT NULL,
  `last_modified` datetime DEFAULT NULL,
  `title` varchar(85) NOT NULL,
  `description` text DEFAULT NULL,
  `allow_participation` tinyint(1) unsigned NOT NULL,
  `allow_anon_participation` tinyint(1) unsigned NOT NULL,
  `type_id` tinyint(2) unsigned NOT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `repeat_type` varchar(10) DEFAULT NULL,
  `repeat_options` varchar(255) DEFAULT NULL,
  `owner_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `last_action_by` mediumint(8) unsigned DEFAULT NULL,
  PRIMARY KEY (`series_id`),
  KEY `type_id` (`type_id`),
  KEY `status_id` (`status_id`),
  KEY `reservations_owner` (`owner_id`),
  CONSTRAINT `reservations_owner` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservations_status` FOREIGN KEY (`status_id`) REFERENCES `reservation_statuses` (`status_id`) ON UPDATE CASCADE,
  CONSTRAINT `reservations_type` FOREIGN KEY (`type_id`) REFERENCES `reservation_types` (`type_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_series`
--

LOCK TABLES `reservation_series` WRITE;
/*!40000 ALTER TABLE `reservation_series` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_statuses`
--

DROP TABLE IF EXISTS `reservation_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_statuses`
--

LOCK TABLES `reservation_statuses` WRITE;
/*!40000 ALTER TABLE `reservation_statuses` DISABLE KEYS */;
INSERT INTO `reservation_statuses` VALUES (1,'Created'),(2,'Deleted'),(3,'Pending');
/*!40000 ALTER TABLE `reservation_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_types`
--

DROP TABLE IF EXISTS `reservation_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_types` (
  `type_id` tinyint(2) unsigned NOT NULL,
  `label` varchar(85) NOT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_types`
--

LOCK TABLES `reservation_types` WRITE;
/*!40000 ALTER TABLE `reservation_types` DISABLE KEYS */;
INSERT INTO `reservation_types` VALUES (1,'Reservation'),(2,'Blackout');
/*!40000 ALTER TABLE `reservation_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_users`
--

DROP TABLE IF EXISTS `reservation_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_users` (
  `reservation_instance_id` int(10) unsigned NOT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `reservation_user_level` tinyint(2) unsigned NOT NULL,
  PRIMARY KEY (`reservation_instance_id`,`user_id`),
  KEY `reservation_instance_id` (`reservation_instance_id`),
  KEY `user_id` (`user_id`),
  KEY `reservation_user_level` (`reservation_user_level`),
  CONSTRAINT `reservation_users_ibfk_1` FOREIGN KEY (`reservation_instance_id`) REFERENCES `reservation_instances` (`reservation_instance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `reservation_users_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_users`
--

LOCK TABLES `reservation_users` WRITE;
/*!40000 ALTER TABLE `reservation_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservation_waitlist_requests`
--

DROP TABLE IF EXISTS `reservation_waitlist_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservation_waitlist_requests` (
  `reservation_waitlist_request_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  PRIMARY KEY (`reservation_waitlist_request_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `reservation_waitlist_requests_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reservation_waitlist_requests_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservation_waitlist_requests`
--

LOCK TABLES `reservation_waitlist_requests` WRITE;
/*!40000 ALTER TABLE `reservation_waitlist_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `reservation_waitlist_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_accessories`
--

DROP TABLE IF EXISTS `resource_accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_accessories` (
  `resource_accessory_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_id` smallint(5) unsigned NOT NULL,
  `accessory_id` smallint(5) unsigned NOT NULL,
  `minimum_quantity` smallint(6) DEFAULT NULL,
  `maximum_quantity` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`resource_accessory_id`),
  KEY `resource_id` (`resource_id`),
  KEY `accessory_id` (`accessory_id`),
  CONSTRAINT `resource_accessories_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_accessories_ibfk_2` FOREIGN KEY (`accessory_id`) REFERENCES `accessories` (`accessory_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_accessories`
--

LOCK TABLES `resource_accessories` WRITE;
/*!40000 ALTER TABLE `resource_accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_group_assignment`
--

DROP TABLE IF EXISTS `resource_group_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_group_assignment` (
  `resource_group_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`resource_group_id`,`resource_id`),
  KEY `resource_group_assignment_resource_id` (`resource_id`),
  KEY `resource_group_assignment_resource_group_id` (`resource_group_id`),
  CONSTRAINT `resource_group_assignment_ibfk_1` FOREIGN KEY (`resource_group_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_group_assignment_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_group_assignment`
--

LOCK TABLES `resource_group_assignment` WRITE;
/*!40000 ALTER TABLE `resource_group_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_group_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_groups`
--

DROP TABLE IF EXISTS `resource_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_groups` (
  `resource_group_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_group_name` varchar(75) DEFAULT NULL,
  `parent_id` mediumint(8) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`resource_group_id`),
  KEY `resource_groups_parent_id` (`parent_id`),
  CONSTRAINT `resource_groups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `resource_groups` (`resource_group_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_groups`
--

LOCK TABLES `resource_groups` WRITE;
/*!40000 ALTER TABLE `resource_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_status_reasons`
--

DROP TABLE IF EXISTS `resource_status_reasons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_status_reasons` (
  `resource_status_reason_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` tinyint(3) unsigned NOT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`resource_status_reason_id`),
  KEY `status_id` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_status_reasons`
--

LOCK TABLES `resource_status_reasons` WRITE;
/*!40000 ALTER TABLE `resource_status_reasons` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_status_reasons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_type_assignment`
--

DROP TABLE IF EXISTS `resource_type_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_type_assignment` (
  `resource_id` smallint(5) unsigned NOT NULL,
  `resource_type_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`resource_id`,`resource_type_id`),
  KEY `resource_type_id` (`resource_type_id`),
  CONSTRAINT `resource_type_assignment_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE,
  CONSTRAINT `resource_type_assignment_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_type_assignment`
--

LOCK TABLES `resource_type_assignment` WRITE;
/*!40000 ALTER TABLE `resource_type_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_type_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_types`
--

DROP TABLE IF EXISTS `resource_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resource_types` (
  `resource_type_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `resource_type_name` varchar(75) DEFAULT NULL,
  `resource_type_description` text DEFAULT NULL,
  PRIMARY KEY (`resource_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_types`
--

LOCK TABLES `resource_types` WRITE;
/*!40000 ALTER TABLE `resource_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `resource_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `contact_info` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `min_duration` int(11) DEFAULT NULL,
  `min_increment` int(11) DEFAULT NULL,
  `max_duration` int(11) DEFAULT NULL,
  `unit_cost` decimal(7,2) DEFAULT NULL,
  `autoassign` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `requires_approval` tinyint(1) unsigned NOT NULL,
  `allow_multiday_reservations` tinyint(1) unsigned NOT NULL DEFAULT 1,
  `max_participants` mediumint(8) unsigned DEFAULT NULL,
  `min_notice_time` int(11) DEFAULT NULL,
  `max_notice_time` int(11) DEFAULT NULL,
  `image_name` varchar(50) DEFAULT NULL,
  `schedule_id` smallint(5) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `sort_order` tinyint(2) unsigned DEFAULT NULL,
  `resource_type_id` mediumint(8) unsigned DEFAULT NULL,
  `status_id` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `resource_status_reason_id` smallint(5) unsigned DEFAULT NULL,
  `buffer_time` int(10) unsigned DEFAULT NULL,
  `enable_check_in` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `auto_release_minutes` smallint(5) unsigned DEFAULT NULL,
  `color` varchar(10) DEFAULT NULL,
  `allow_display` tinyint(1) unsigned NOT NULL DEFAULT 0,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  `peak_credit_count` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `admin_group_id` (`admin_group_id`),
  KEY `resource_type_id` (`resource_type_id`),
  KEY `resource_status_reason_id` (`resource_status_reason_id`),
  KEY `auto_release_minutes` (`auto_release_minutes`),
  CONSTRAINT `admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `resources_ibfk_2` FOREIGN KEY (`resource_type_id`) REFERENCES `resource_types` (`resource_type_id`) ON DELETE SET NULL,
  CONSTRAINT `resources_ibfk_3` FOREIGN KEY (`resource_status_reason_id`) REFERENCES `resource_status_reasons` (`resource_status_reason_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'Vidéo Projecteur',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,'resource1.jpg',1,NULL,NULL,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00),(2,'Webcam Caméra USB',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,'resource2.jpg',1,NULL,NULL,NULL,0,0,NULL,1,NULL,NULL,0,NULL,'',0,0.00,0.00),(3,'Cafétéria',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(4,'Salle de Réunion',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(5,'Atelier Mécanique',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,2,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(6,'Voiture Renault Kangoo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(7,'Voiture Citroën C3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL),(8,'Ordinateur Portable',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,0,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,NULL,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `role_id` tinyint(2) unsigned NOT NULL,
  `name` varchar(85) DEFAULT NULL,
  `role_level` tinyint(2) unsigned DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Group Admin',1),(2,'Application Admin',2),(3,'Resource Admin',3),(4,'Schedule Admin',4);
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `saved_reports`
--

DROP TABLE IF EXISTS `saved_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `saved_reports` (
  `saved_report_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `report_name` varchar(50) DEFAULT NULL,
  `user_id` mediumint(8) unsigned NOT NULL,
  `date_created` datetime NOT NULL,
  `report_details` varchar(500) NOT NULL,
  PRIMARY KEY (`saved_report_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `saved_reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `saved_reports`
--

LOCK TABLES `saved_reports` WRITE;
/*!40000 ALTER TABLE `saved_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `saved_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedules`
--

DROP TABLE IF EXISTS `schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedules` (
  `schedule_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(85) NOT NULL,
  `isdefault` tinyint(1) unsigned NOT NULL,
  `weekdaystart` tinyint(2) unsigned NOT NULL,
  `daysvisible` tinyint(2) unsigned NOT NULL DEFAULT 7,
  `layout_id` mediumint(8) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `admin_group_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`schedule_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `layout_id` (`layout_id`),
  KEY `schedules_groups_admin_group_id` (`admin_group_id`),
  CONSTRAINT `schedules_groups_admin_group_id` FOREIGN KEY (`admin_group_id`) REFERENCES `groups` (`group_id`) ON DELETE SET NULL,
  CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedules`
--

LOCK TABLES `schedules` WRITE;
/*!40000 ALTER TABLE `schedules` DISABLE KEYS */;
INSERT INTO `schedules` VALUES (1,'Matériel Informatique',1,0,7,1,NULL,NULL,0,NULL),(2,'Salles',0,100,7,1,NULL,NULL,0,NULL),(3,'Véhicules',0,100,7,1,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `schedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time_blocks`
--

DROP TABLE IF EXISTS `time_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time_blocks` (
  `block_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `label` varchar(85) DEFAULT NULL,
  `end_label` varchar(85) DEFAULT NULL,
  `availability_code` tinyint(2) unsigned NOT NULL,
  `layout_id` mediumint(8) unsigned NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day_of_week` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`block_id`),
  KEY `layout_id` (`layout_id`),
  CONSTRAINT `time_blocks_ibfk_1` FOREIGN KEY (`layout_id`) REFERENCES `layouts` (`layout_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time_blocks`
--

LOCK TABLES `time_blocks` WRITE;
/*!40000 ALTER TABLE `time_blocks` DISABLE KEYS */;
INSERT INTO `time_blocks` VALUES (1,NULL,NULL,2,1,'00:00:00','08:00:00',NULL),(2,NULL,NULL,1,1,'08:00:00','08:30:00',NULL),(3,NULL,NULL,1,1,'08:30:00','09:00:00',NULL),(4,NULL,NULL,1,1,'09:00:00','09:30:00',NULL),(5,NULL,NULL,1,1,'09:30:00','10:00:00',NULL),(6,NULL,NULL,1,1,'10:00:00','10:30:00',NULL),(7,NULL,NULL,1,1,'10:30:00','11:00:00',NULL),(8,NULL,NULL,1,1,'11:00:00','11:30:00',NULL),(9,NULL,NULL,1,1,'11:30:00','12:00:00',NULL),(10,NULL,NULL,1,1,'12:00:00','12:30:00',NULL),(11,NULL,NULL,1,1,'12:30:00','13:00:00',NULL),(12,NULL,NULL,1,1,'13:00:00','13:30:00',NULL),(13,NULL,NULL,1,1,'13:30:00','14:00:00',NULL),(14,NULL,NULL,1,1,'14:00:00','14:30:00',NULL),(15,NULL,NULL,1,1,'14:30:00','15:00:00',NULL),(16,NULL,NULL,1,1,'15:00:00','15:30:00',NULL),(17,NULL,NULL,1,1,'15:30:00','16:00:00',NULL),(18,NULL,NULL,1,1,'16:00:00','16:30:00',NULL),(19,NULL,NULL,1,1,'16:30:00','17:00:00',NULL),(20,NULL,NULL,1,1,'17:00:00','17:30:00',NULL),(21,NULL,NULL,1,1,'17:30:00','18:00:00',NULL),(22,NULL,NULL,2,1,'18:00:00','00:00:00',NULL);
/*!40000 ALTER TABLE `time_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_email_preferences`
--

DROP TABLE IF EXISTS `user_email_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_email_preferences` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `event_category` varchar(45) NOT NULL,
  `event_type` varchar(45) NOT NULL,
  PRIMARY KEY (`user_id`,`event_category`,`event_type`),
  CONSTRAINT `user_email_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_email_preferences`
--

LOCK TABLES `user_email_preferences` WRITE;
/*!40000 ALTER TABLE `user_email_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_email_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_groups` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `group_id` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`group_id`,`user_id`),
  KEY `user_id` (`user_id`),
  KEY `group_id` (`group_id`),
  CONSTRAINT `user_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
INSERT INTO `user_groups` VALUES (2,2);
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_preferences`
--

DROP TABLE IF EXISTS `user_preferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_preferences` (
  `user_preferences_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`user_preferences_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `user_preferences_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_preferences`
--

LOCK TABLES `user_preferences` WRITE;
/*!40000 ALTER TABLE `user_preferences` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_preferences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_resource_permissions`
--

DROP TABLE IF EXISTS `user_resource_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_resource_permissions` (
  `user_id` mediumint(8) unsigned NOT NULL,
  `resource_id` smallint(5) unsigned NOT NULL,
  `permission_id` tinyint(2) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`user_id`,`resource_id`),
  KEY `user_id` (`user_id`),
  KEY `resource_id` (`resource_id`),
  CONSTRAINT `user_resource_permissions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_resource_permissions_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resources` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_resource_permissions`
--

LOCK TABLES `user_resource_permissions` WRITE;
/*!40000 ALTER TABLE `user_resource_permissions` DISABLE KEYS */;
INSERT INTO `user_resource_permissions` VALUES (1,1,1),(1,2,1),(1,3,1),(1,4,1),(1,5,1),(1,6,1),(1,7,1),(1,8,1),(2,1,1),(2,2,1),(2,3,1),(2,4,1),(2,5,1),(2,6,1),(2,7,1),(2,8,1);
/*!40000 ALTER TABLE `user_resource_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `user_session_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` mediumint(8) unsigned NOT NULL,
  `last_modified` datetime NOT NULL,
  `session_token` varchar(50) NOT NULL,
  `user_session_value` text NOT NULL,
  PRIMARY KEY (`user_session_id`),
  KEY `user_session_user_id` (`user_id`),
  KEY `user_session_session_token` (`session_token`),
  CONSTRAINT `user_session_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_session`
--

LOCK TABLES `user_session` WRITE;
/*!40000 ALTER TABLE `user_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_statuses`
--

DROP TABLE IF EXISTS `user_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_statuses` (
  `status_id` tinyint(2) unsigned NOT NULL,
  `description` varchar(85) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_statuses`
--

LOCK TABLES `user_statuses` WRITE;
/*!40000 ALTER TABLE `user_statuses` DISABLE KEYS */;
INSERT INTO `user_statuses` VALUES (1,'Active'),(2,'Awaiting'),(3,'Inactive');
/*!40000 ALTER TABLE `user_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `fname` varchar(85) DEFAULT NULL,
  `lname` varchar(85) DEFAULT NULL,
  `username` varchar(85) DEFAULT NULL,
  `email` varchar(85) NOT NULL,
  `password` varchar(85) NOT NULL,
  `salt` varchar(85) NOT NULL,
  `organization` varchar(85) DEFAULT NULL,
  `position` varchar(85) DEFAULT NULL,
  `phone` varchar(85) DEFAULT NULL,
  `timezone` varchar(85) NOT NULL,
  `language` varchar(10) NOT NULL,
  `homepageid` tinyint(2) unsigned NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL,
  `last_modified` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `lastlogin` datetime DEFAULT NULL,
  `status_id` tinyint(2) unsigned NOT NULL,
  `legacyid` char(16) DEFAULT NULL,
  `legacypassword` varchar(32) DEFAULT NULL,
  `public_id` varchar(20) DEFAULT NULL,
  `allow_calendar_subscription` tinyint(1) NOT NULL DEFAULT 0,
  `default_schedule_id` smallint(5) unsigned DEFAULT NULL,
  `credit_count` decimal(7,2) unsigned DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `public_id` (`public_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`status_id`) REFERENCES `user_statuses` (`status_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'User','User','user','user@example.com','7b6aec38ff9b7650d64d0374194307bdde711425','3b3dbb9b','XYZ Org Inc.',NULL,NULL,'America/Chicago','en_us',2,'2022-09-20 09:35:32','2022-09-30 09:29:45','2022-09-30 09:29:45',1,NULL,NULL,'6336b709ed4d8',0,2,0.00),(2,'Admin','Admin','admin','admin@example.com','70f3e748c6801656e4aae9dca6ee98ab137d952c','4a04db87','ABC Org Inc.',NULL,NULL,'America/Chicago','en_us',2,'2022-09-20 09:35:32','2022-09-30 09:29:51','2022-09-30 09:29:51',1,NULL,NULL,'6336b26e33b26',0,2,0.00);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30  9:52:12
