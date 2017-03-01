-- ToDo:
-- Check Spells
-- Check why Engine != InnoDB reason?
-- Check if something is missing

-- TC Version: bbc6799cd7c0a83b81496c01d21c110decebae6d
-- AC Version: c92d0403a7047414fcb5901f08da7dd652ca382c

-- ToDo if working:
-- Split into different files (each table one file)
-- sh script to generate whole script

CREATE TABLE `character_brew_of_the_month` (
  `guid` int(10) unsigned NOT NULL,
  `lastEventId` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `log_arena_fights` (
  `fight_id` int(10) unsigned NOT NULL,
  `time` datetime NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `winner` int(10) unsigned NOT NULL,
  `loser` int(10) unsigned NOT NULL,
  `winner_tr` smallint(5) unsigned NOT NULL,
  `winner_mmr` smallint(5) unsigned NOT NULL,
  `winner_tr_change` smallint(6) NOT NULL,
  `loser_tr` smallint(5) unsigned NOT NULL,
  `loser_mmr` smallint(5) unsigned NOT NULL,
  `loser_tr_change` smallint(6) NOT NULL,
  `currOnline` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fight_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_arena_memberstats` (
  `fight_id` int(10) unsigned NOT NULL,
  `member_id` tinyint(3) unsigned NOT NULL,
  `name` char(20) NOT NULL,
  `guid` int(10) unsigned NOT NULL,
  `team` int(10) unsigned NOT NULL,
  `account` int(10) unsigned NOT NULL,
  `ip` char(15) NOT NULL,
  `damage` int(10) unsigned NOT NULL,
  `heal` int(10) unsigned NOT NULL,
  `kblows` int(10) unsigned NOT NULL,
  PRIMARY KEY (`fight_id`,`member_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_encounter` (
  `time` datetime NOT NULL,
  `map` smallint(5) unsigned NOT NULL,
  `difficulty` tinyint(3) unsigned NOT NULL,
  `creditType` tinyint(3) unsigned NOT NULL,
  `creditEntry` int(10) unsigned NOT NULL,
  `playersInfo` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE TABLE `log_money` (
  `sender_acc` int(11) unsigned NOT NULL,
  `sender_guid` int(11) unsigned NOT NULL,
  `sender_name` char(32) CHARACTER SET utf8 NOT NULL,
  `sender_ip` char(32) CHARACTER SET utf8 NOT NULL,
  `receiver_acc` int(11) unsigned NOT NULL,
  `receiver_name` char(32) CHARACTER SET utf8 NOT NULL,
  `money` bigint(20) unsigned NOT NULL,
  `topic` char(255) CHARACTER SET utf8 NOT NULL,
  `date` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
CREATE TABLE `gm_subsurveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `subsurveyId` int(10) unsigned NOT NULL DEFAULT '0',
  `rank` int(10) unsigned NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  PRIMARY KEY (`surveyId`,`subsurveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';
CREATE TABLE `gm_surveys` (
  `surveyId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0',
  `mainSurvey` int(10) unsigned NOT NULL DEFAULT '0',
  `overallComment` longtext NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxMMR` smallint(5) NOT NULL,
  PRIMARY KEY (`surveyId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';
CREATE TABLE `gm_tickets` (
  `ticketId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier of ticket creator',
  `name` varchar(12) NOT NULL COMMENT 'Name of ticket creator',
  `message` text NOT NULL,
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `mapId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posX` float NOT NULL DEFAULT '0',
  `posY` float NOT NULL DEFAULT '0',
  `posZ` float NOT NULL DEFAULT '0',
  `lastModifiedTime` int(10) unsigned NOT NULL DEFAULT '0',
  `closedBy` int(10) NOT NULL DEFAULT '0',
  `assignedTo` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'GUID of admin to whom ticket is assigned',
  `comment` text NOT NULL,
  `response` text NOT NULL,
  `completed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `escalated` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `viewed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `haveTicket` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ticketId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';
CREATE TABLE `item_loot_storage` (
  `containerGUID` int(10) unsigned NOT NULL,
  `itemid` int(10) unsigned NOT NULL,
  `count` int(10) unsigned NOT NULL,
  `randomPropertyId` int(10) NOT NULL,
  `randomSuffix` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `character_entry_point` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Global Unique Identifier',
  `joinX` float NOT NULL DEFAULT '0',
  `joinY` float NOT NULL DEFAULT '0',
  `joinZ` float NOT NULL DEFAULT '0',
  `joinO` float NOT NULL DEFAULT '0',
  `joinMapId` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Identifier',
  `taxiPath` text,
  `mountSpell` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Player System';
CREATE TABLE `channels_bans` (
  `channelId` int(10) unsigned NOT NULL,
  `playerGUID` int(10) unsigned NOT NULL,
  `banTime` int(10) unsigned NOT NULL,
  PRIMARY KEY (`channelId`,`playerGUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Table structure for table `channels_rights`
--

DROP TABLE IF EXISTS `channels_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channels_rights` (
  `name` varchar(128) NOT NULL,
  `flags` int(10) unsigned NOT NULL,
  `speakdelay` int(10) unsigned NOT NULL,
  `joinmessage` varchar(255) NOT NULL DEFAULT '',
  `delaymessage` varchar(255) NOT NULL DEFAULT '',
  `moderators` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `channels_rights`
--

LOCK TABLES `channels_rights` WRITE;
/*!40000 ALTER TABLE `channels_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `channels_rights` ENABLE KEYS */;
UNLOCK TABLES;


ALTER TABLE `character_spell_cooldown` ADD COLUMN `needSend` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' AFTER `categoryEnd`;
ALTER TABLE `auctionhouse` CHANGE COLUMN `houseid` `auctioneerguid` INT(10) UNSIGNED NOT NULL DEFAULT '0' ;
ALTER TABLE `channels` 
ADD COLUMN `channelId` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`channelId`);

TRUNCATE TABLE `character_talent`;

ALTER TABLE `character_talent` CHANGE COLUMN `talentGroup` `specMask` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`guid`, `spell`);

ALTER TABLE `characters` 
ADD COLUMN `playerBytes` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `money`,
ADD COLUMN `playerBytes2` INT(10) UNSIGNED NOT NULL DEFAULT '0' AFTER `playerBytes`;
UPDATE `characters` SET 
 playerBytes = (skin) | (face << 8) | (hairStyle << 16) | (hairColor << 24),
 playerBytes2 = (facialStyle) | (bankSlots << 16) | (restState << 24)
WHERE guid > 0;
ALTER TABLE `characters` DROP COLUMN `skin`;
ALTER TABLE `characters` DROP COLUMN `face`;
ALTER TABLE `characters` DROP COLUMN `hairStyle`;
ALTER TABLE `characters` DROP COLUMN `hairColor`;
ALTER TABLE `characters` DROP COLUMN `facialStyle`;
ALTER TABLE `characters` DROP COLUMN `bankSlots`;
ALTER TABLE `characters` 
CHANGE COLUMN `talentGroupsCount` `speccount` TINYINT(3) UNSIGNED NOT NULL DEFAULT '1' ,
CHANGE COLUMN `activeTalentGroup` `activespec` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
DROP COLUMN `restState`;

-- Not used
-- ALTER TABLE `character_glyphs` CHANGE COLUMN `talentGroup` `spec` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0';


ALTER TABLE `character_instance` CHANGE COLUMN `extendState` `extended` TINYINT(2) UNSIGNED NOT NULL DEFAULT '0' ;

ALTER TABLE `character_arena_stats` 
ADD COLUMN `maxMMR` smallint(5) NOT NULL AFTER `matchMakerRating`;

TRUNCATE TABLE `corpse`;
ALTER TABLE `corpse` 
ADD COLUMN `corpseGuid` INT(10) UNSIGNED NOT NULL DEFAULT '0' FIRST,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`corpseGuid`, `guid`);

ALTER TABLE `character_aura` 
ADD COLUMN `itemGuid` BIGINT(20) NOT NULL AFTER `casterGuid`;


ALTER TABLE `pet_aura` 
CHANGE COLUMN `casterGuid` `caster_guid` BIGINT(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Full Global Unique Identifier' ,
CHANGE COLUMN `effectMask` `effect_mask` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ,
CHANGE COLUMN `recalculateMask` `recalculate_mask` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' ;


ALTER TABLE character_spell DROP COLUMN `active`;
ALTER TABLE character_spell DROP COLUMN `disabled`;
ALTER TABLE character_spell ADD `specMask` tinyint(3) unsigned NOT NULL DEFAULT 255;


-- ALTER TABLE character_talent CHANGE `talentGroup` `specMask` tinyint(3) unsigned NOT NULL DEFAULT 0;

UPDATE characters SET speccount=1 WHERE speccount=0;


DELETE s FROM character_spell s JOIN __del_ability_spell t ON s.spell=t.spell; -- Remove all spells from spellability.dbc
DELETE s FROM character_spell s JOIN __del_override_spell t ON s.spell=t.spell; -- Remove all spells from overridespell.dbc
DELETE s FROM character_spell s JOIN __del_shapeshift_spell t ON s.spell=t.spell; -- Remove all spells from shapeshift.dbc
DELETE s FROM character_spell s JOIN __del_spell_learn_spell t ON s.spell=t.spell; -- Remove all spells from old spell_learn_spell table
DELETE s FROM character_spell s JOIN __del_talent_rest_ranks t ON s.spell=t.spell; -- Remove all talents which should not be in character_spell table
DELETE s FROM character_spell s JOIN __playercreateinfo_spell t ON s.spell=t.spell JOIN characters c ON s.guid = c.guid WHERE (t.racemask=0 OR (1<<(c.race-1))&t.racemask) AND (t.classmask=0 OR (1<<(c.class-1))&t.classmask); -- Remove all spells from playercreateinfo_spell
DELETE s FROM character_spell s JOIN __profession_autolearn t ON s.spell=t.spell; -- Remove all spells that are automatically learned from certain skill level
DELETE s FROM character_spell s JOIN characters c ON s.guid = c.guid WHERE s.spell = 674 AND c.class = 7; -- Remove Dual Wield From shamans
DELETE s FROM character_spell s JOIN __del_talent_pyroblast t1 ON s.spell=t1.spell LEFT JOIN __del_talent_pyroblast2 t2 ON t1.spell=t2.spell WHERE t2.spell IS NULL;


-- restore lower ranks not saved (dependant was not saved)
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=16);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=15);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=14);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=13);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=12);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=11);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=10);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=9);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=8);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=7);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=6);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=5);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=4);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=3);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell_id, 255 FROM character_spell s JOIN __spell_ranks t ON s.spell = t.spell_id JOIN __spell_ranks t2 ON t.first_spell_id=t2.first_spell_id AND (t.rank-1)=t2.rank WHERE t.rank=2);


UPDATE character_spell SET specMask=255; -- Set specMask of all spells to 255
UPDATE character_spell s JOIN __del_talent_pyroblast t ON s.spell=t.spell SET specMask=0; -- Set specMask to 0 for spells added to spellbook


-- Add missing profession spells
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=6);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=5);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=4);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=3);
INSERT IGNORE INTO character_spell (SELECT s.guid, t2.spell, 255 FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell JOIN __profession_skill t2 ON t.skill=t2.skill AND (t.rank-1)=t2.rank WHERE t.rank=2);


-- Insert skill if missing (core would do this, but we need it for the queries below)
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=6);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=5);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=4);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=3);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=2);
INSERT IGNORE INTO character_skills (SELECT s.guid, t.skill, 1, t.maxvalue FROM __profession_skill t JOIN character_spell s ON t.spell = s.spell WHERE t.rank=1);


-- Update max allowed skill based on spells
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=6 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=5 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=4 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=3 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=2 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
UPDATE character_skills cs JOIN __profession_skill t ON cs.skill = t.skill LEFT JOIN character_spell s ON cs.guid = s.guid AND t.spell = s.spell SET cs.max=(t.maxvalue-75) WHERE t.rank=1 AND s.guid IS NULL AND cs.max > (t.maxvalue-75);
DELETE FROM character_skills WHERE max=0;
UPDATE character_skills SET value=max WHERE value>max;



-- Remove primary professions when having more than 2!
-- first delete skill
SET @cnt := 0;
SET @prevguid := 0;
DELETE s FROM character_skills s JOIN ((SELECT guid, skill FROM ((SELECT IF(@prevguid <> cs.guid, @cnt := 1, @cnt := @cnt+1) AS cnt, (@prevguid := guid) AS guid, cs.skill AS skill FROM character_skills cs JOIN __profession_skill t ON cs.skill = t.skill AND t.rank=6 ORDER BY cs.guid, cs.skill) x) WHERE cnt>2) x2) ON s.guid = x2.guid AND s.skill = x2.skill;
-- now delete main profession spells if skill is missing
DELETE s FROM character_spell s JOIN __profession_skill t ON s.spell = t.spell LEFT JOIN character_skills cs ON s.guid = cs.guid AND t.skill = cs.skill WHERE cs.guid IS NULL;


-- PROFESSION SPECIALTY DATA!
-- TRUNCATE TABLE __profession_spell_req_spell;
-- Alchemy (rank 1 - 2259): 28672 (transmute), 28677 (elixir), 28675 (potion)
-- Blacksmithing (rank 1 - 2018): 9788 (armorsmith), 9787 (weaponsmith) -- Weaponsmith: 17040 (hammer), 17041 (axe), 17039 (sword)
-- Leatherworking (rank 1 - 2108): 10656 (dragon), 10658 (elemental), 10660 (tribal)
-- Tailoring (rank 1 - 3908): 26798 (mooncloth), 26801 (shadoweave), 26797 (spellfire)
-- Engineering (rank 1 - 4036): 20222 (goblin), 20219 (gnomish)
-- INSERT INTO __profession_spell_req_spell VALUES(28672, 2259), (28677, 2259), (28675, 2259);
-- INSERT INTO __profession_spell_req_spell VALUES(9788, 2018), (9787, 2018), (17040, 9787), (17041, 9787), (17039, 9787);
-- INSERT INTO __profession_spell_req_spell VALUES(10656, 2108), (10658, 2108), (10660, 2108);
-- INSERT INTO __profession_spell_req_spell VALUES(26798, 3908), (26801, 3908), (26797, 3908);
-- INSERT INTO __profession_spell_req_spell VALUES(20222, 4036), (20219, 4036);
-- THERE ARE ALSO SPECIALTY RECIPES IN THIS TABLE!
-- INSERT INTO __profession_spell_req_spell VALUES(36125, 9787), (36128, 9787), (36126, 9787); -- Weaponsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36122, 9788), (36129, 9788), (36130, 9788), (34533, 9788), (34529, 9788), (34534, 9788), (36257, 9788), (36256, 9788), (34530, 9788), (36124, 9788); -- Armorsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36262, 17040), (34546, 17040), (34545, 17040), (36136, 17040), (34547, 17040), (34567, 17040), (36263, 17040), (36137, 17040); -- Hammersmith
-- INSERT INTO __profession_spell_req_spell VALUES(36260, 17041), (34562, 17041), (34541, 17041), (36134, 17041), (36135, 17041), (36261, 17041), (34543, 17041), (34544, 17041); -- Axesmith
-- INSERT INTO __profession_spell_req_spell VALUES(36258, 17039), (34537, 17039), (34535, 17039), (36131, 17039), (36133, 17039), (34538, 17039), (34540, 17039), (36259, 17039); -- Swordsmith
-- INSERT INTO __profession_spell_req_spell VALUES(36076, 10656), (36079, 10656), (35576, 10656), (35577, 10656), (35575, 10656), (35582, 10656), (35584, 10656), (35580, 10656); -- Dragon
-- INSERT INTO __profession_spell_req_spell VALUES(36074, 10658), (36077, 10658), (35590, 10658), (35591, 10658), (35589, 10658); -- Elemental
-- INSERT INTO __profession_spell_req_spell VALUES(35585, 10660), (35587, 10660), (35588, 10660), (36075, 10660), (36078, 10660); -- Tribal
-- INSERT INTO __profession_spell_req_spell VALUES(26752, 26797), (26753, 26797), (26754, 26797); -- Spellfire
-- INSERT INTO __profession_spell_req_spell VALUES(26760, 26798), (26761, 26798), (26762, 26798); -- Mooncloth
-- INSERT INTO __profession_spell_req_spell VALUES(26756, 26801), (26757, 26801), (26758, 26801); -- Shadoweave


-- Remove double specialties (always leaves last from the list above)
-- Alchemy
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28677 WHERE s.spell=28672;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28675 WHERE s.spell=28672;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=28675 WHERE s.spell=28677;
-- Blacksmithing
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=9787 WHERE s.spell=9788;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17041 WHERE s.spell=17040;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17039 WHERE s.spell=17040;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=17039 WHERE s.spell=17041;
-- Leatherworking
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10658 WHERE s.spell=10656;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10660 WHERE s.spell=10656;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=10660 WHERE s.spell=10658;
-- Tailoring
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26801 WHERE s.spell=26798;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26797 WHERE s.spell=26798;
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=26797 WHERE s.spell=26801;
-- Engineering
DELETE s FROM character_spell s JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=20219 WHERE s.spell=20222;


-- Remove spells missing their required spell
-- Run 3 times: first - normal specialty is removed, second - recipes from specialty and specialty of specialty (blacksmithing only), third - recipes of specialty of specialty
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;
DELETE s FROM character_spell s JOIN __profession_spell_req_spell t ON s.spell = t.spell LEFT JOIN character_spell s2 ON s.guid = s2.guid AND s2.spell=t.reqspell WHERE s2.guid IS NULL;


-- Remove spells missing their required skill (the same spells are removed when setting skill to 0)
DELETE s FROM character_spell s JOIN __profession_spell_req_skill t ON s.spell = t.spell LEFT JOIN character_skills cs ON s.guid = cs.guid AND t.reqskill = cs.skill WHERE cs.guid IS NULL;


-- GBoS fix
update character_spell s left join character_talent t on s.guid = t.guid and t.spell = 20911 set s.specMask=0 where s.spell = 25899 and t.guid IS NULL;
update character_spell s join character_talent t on s.guid = t.guid and t.spell = 20911 set s.specMask=t.specMask where s.spell = 25899;


-- add activation spells to all characters with dual spec
REPLACE INTO character_spell
SELECT guid,63645,255 FROM characters WHERE speccount>1;

REPLACE INTO character_spell
SELECT guid,63644,255 FROM characters WHERE speccount>1;
