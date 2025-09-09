-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           PostgreSQL 17.6 on x86_64-windows, compiled by msvc-19.44.35213, 64-bit
-- OS do Servidor:               
-- HeidiSQL Versão:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES  */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Copiando estrutura para tabela app_simulado.opcoes
CREATE TABLE IF NOT EXISTS "opcoes" (
	"id" INTEGER NOT NULL,
	"questao_id" INTEGER NOT NULL,
	"texto_opcao" TEXT NOT NULL,
	"correta" BOOLEAN NOT NULL DEFAULT false,
	PRIMARY KEY ("id"),
	CONSTRAINT "opcoes_ibfk_1" FOREIGN KEY ("questao_id") REFERENCES "questoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Copiando dados para a tabela app_simulado.opcoes: 400 rows
/*!40000 ALTER TABLE "opcoes" DISABLE KEYS */;
INSERT INTO "opcoes" ("id", "questao_id", "texto_opcao", "correta") VALUES
	(1, 1, ' Enables automation with a library of connectors, manages connections easily with standardized authentication, kicks off automations with server-side triggers or events, provides curated activities and events, simplifies automation design.', 'true'),
	(2, 1, 'Automates UI design, manages API connections, provides limited activities and events, simplifies automation design', 'false'),
	(3, 1, '. Enables automation with API integration, manages connections with user-provided authentication, kicks off automations based on application-specific triggers, simplifies automation design with the help of third-party libraries', 'false'),
	(4, 1, 'Enables automation with UI components, manages API keys, kicks off automations with client-side triggers, provides curated events.', 'false'),
	(5, 2, 'The remote robot continues the execution after Studio closes the connection.', 'false'),
	(6, 2, 'Debugging execution ends in exception, then the connection is closed.', 'false'),
	(7, 2, 'Debugging execution stops gracefully, then the connection is closed.', 'false'),
	(8, 2, 'It is not possible to close the connection while debugging is in progress.', 'true'),
	(17, 5, 'Only in the RetryCurrentTransaction.xaml workflow.', 'false'),
	(18, 5, 'Only in the SetTransactionStatus.xaml workflow.', 'false'),
	(19, 5, 'In the New Transaction transition.', 'false'),
	(20, 5, 'In the RetryCurrentTransaction.xaml workflow and in the SetTransactionStatus.xaml workflow.', 'true'),
	(21, 6, 'Verbose', 'true'),
	(22, 6, 'Trace', 'false'),
	(23, 6, 'Critical', 'false'),
	(24, 6, 'Information', 'false'),
	(25, 7, 'The steps of the process refer to the execution of steps in a sequential manner, where each subsequent step depends on the successful completion of the previous step.', 'false'),
	(26, 7, 'The steps of the process are performed multiple times, but each time different data items are used.', 'false'),
	(27, 7, 'The steps of the process repeat multiple times over different data items. However, the automation design is such that each repeatable part processes independently.', 'false'),
	(28, 7, 'The process steps are performed only once. If the need is to process additional data, then the automation must execute again.', 'true'),
	(29, 8, 'The developer should change the input method to Simulate and the CursorMotionType to Instant.', 'false'),
	(30, 8, 'The developer should change the input method to Hardware Events and the CursorMotionType to Smooth.', 'true'),
	(31, 8, 'The property AlterIfDisabled should be set to False.', 'false'),
	(32, 8, 'The property AlterIfDisabled should be set to True.', 'false'),
	(33, 9, 'Flowchart', 'false'),
	(34, 9, 'Workflow', 'false'),
	(35, 9, 'State Machine', 'true'),
	(36, 9, 'Global Exception Handler', 'false'),
	(45, 12, 'Inherited', 'true'),
	(46, 12, 'Medium', 'false'),
	(47, 12, 'High', 'false'),
	(48, 12, 'Low ', 'false'),
	(49, 13, 'An exception is thrown after 10 milliseconds.', 'false'),
	(50, 13, 'An exception is thrown after 10 seconds.', 'false'),
	(51, 13, 'The next activity is executed after 10 seconds.', 'true'),
	(52, 13, 'The next activity is executed after 10 milliseconds', 'false'),
	(53, 14, 'Click Right on the Test Case and select Update Test Data.', 'true'),
	(54, 14, 'Click Right on the Test Case and select Add Test Data.', 'false'),
	(55, 14, 'Click Right on the Test Case and select Refresh Test Data.', 'false'),
	(56, 14, 'Click Right on the Test Case and select Remove Test Data. ', 'false'),
	(61, 16, 'UI Automation can be used and the following are prerequisites: Machine A - install RDP extension. Machine B - install RemoteRuntime.msi. Machine C - install RemoteRuntime.msi.', 'false'),
	(62, 16, 'UI Automation can be used and the following are prerequisites: Machine A - install RDP extension. Machine B - install RDP extension and RemoteRuntime.msi. Machine C - install RemoteRuntime.msi.', 'true'),
	(63, 16, 'UI Automation can be used and the following are prerequisites: Machine A - no requirement. Machine B - no requirement. Machine C - install RemoteRuntime.msi.', 'false'),
	(64, 16, 'UI Automation can be used and the following are prerequisites: Machine A - install RDP extension. Machine B - no requirement. Machine C - install RemoteRuntime.msi. ', 'false'),
	(69, 18, 'Each running process automatically adapts to the available dependency version.', 'false'),
	(70, 18, 'Each running process uses its own required version of the dependency.', 'true'),
	(71, 18, 'All running processes use the latest version of the dependency available.', 'false'),
	(72, 18, 'Running processes use the earliest compatible dependency version.', 'false'),
	(73, 19, 'Remove the Get Transaction Data state from the Main state machine. Remove the OrchestratorQueueName setting from Config.xlsx & change the variable type.', 'false'),
	(74, 19, 'Eliminate the Get Transaction Data state from the Main state machine. Exclude the Get Transaction Item activity from the project & change the variable type.', 'false'),
	(75, 19, 'Exclude the Get Transaction Item activity from the project. Eliminate the three SetTransactionStatus activities from the SetTransactionStatus workflow & change the variable type.', 'true'),
	(76, 19, 'Omit the OrchestratorQueueName setting from the Config.xlsx file. Exclude the three SetTransactionStatus activities from the SetTransactionStatus workflow & change the variable type. ', 'false'),
	(77, 20, 'Version, Application, Screen, UI Element.', 'false'),
	(78, 20, 'Application, Version, Screen, UI Element.', 'true'),
	(79, 20, 'Application, Screen, UI Element, Version.', 'false'),
	(80, 20, 'Screen, Application, Version, UI Element.', 'false'),
	(81, 21, 'An exception will be thrown.', 'true'),
	(82, 21, 'Colors will contain an item with the value "Yellow".', 'false'),
	(83, 21, 'Colors will contain an item with an empty value.', 'false'),
	(84, 21, 'Colors will contain an item with the value "Colors: Yellow". ', 'false'),
	(85, 22, '1 minute', 'false'),
	(86, 22, '5 minutes', 'true'),
	(87, 22, '10 minutes', 'false'),
	(88, 22, '15 minutes ', 'false'),
	(89, 23, 'Highlighting all UI elements that have been identified by the Computer Vision analysis.', 'true'),
	(90, 23, 'Displaying a list of all available UI elements and their properties.', 'false'),
	(91, 23, 'Activating a real-time view of the target app''s UI during automation.', 'false'),
	(92, 23, 'Filtering out specific UI elements from being processed by the Computer Vision engine. ', 'false'),
	(93, 24, 'Entry', 'false'),
	(94, 24, 'Transitions', 'true'),
	(95, 24, 'Triggers', 'false'),
	(96, 24, 'Exit ', 'false'),
	(97, 25, 'To maintain contextual insights within log messages, including secure details like credentials.', 'false'),
	(98, 25, 'To add specific contextual information to log messages that are relevant to the automation process.', 'true'),
	(99, 25, 'To modify the representation of logged contextual data as it is displayed in the Orchestrator.', 'false'),
	(100, 25, 'To generate extra variables alongside log messages, enhancing workflow understanding.', 'false'),
	(101, 26, 'MoveAt', 'false'),
	(102, 26, 'SetOrdinal', 'true'),
	(103, 26, 'SetColumnIndex', 'false'),
	(104, 26, 'SetIndex ', 'false'),
	(105, 27, 'Delay before', 'false'),
	(106, 27, 'Delay between keys', 'true'),
	(107, 27, 'Delay after', 'false'),
	(108, 27, 'Alter disabled element', 'false'),
	(109, 28, 'Synchronize mock.', 'false'),
	(110, 28, 'Create mock workflow.', 'false'),
	(111, 28, 'Surround activity with mock.', 'true'),
	(112, 28, 'Remove mock activity.  ', 'false'),
	(113, 29, 'The activity will use only properties set in Activity Project Settings.', 'false'),
	(114, 29, 'The activity will remove Multi Line in Run mode and a Single Line in Debug mode.', 'false'),
	(115, 29, 'The activity will remove a Single Line in Run mode and in Debug mode.', 'true'),
	(116, 29, 'The activity will remove a Single Line in Run mode and Multi Line in Debug mode. ', 'false'),
	(117, 30, 'Percent of test data run.', 'false'),
	(118, 30, 'Correctness of the code percent.', 'false'),
	(119, 30, 'Coverage percent.', 'true'),
	(120, 30, 'Passing percent. ', 'false'),
	(121, 31, 'Property: FilterByMessageIds Schema: "@SQL=""urn:schemas:httpmail:subject''"'' like ''UiPath%''"', 'false'),
	(122, 31, 'Property: Filter Schema: "@SQL=""urn:schemas:httpmail:subject"" like ''UiPath%''"', 'false'),
	(123, 31, 'Property: Filter Schema: "@SQL=""urn:schemas:httpmail:subject"" like ''%UiPath%''"', 'true'),
	(124, 31, 'Property: FilterByMessageIds Schema: "@SQL=""urn:schemas:httpmail:subject"" like ''%UiPath%''"', 'false'),
	(125, 32, '1', 'false'),
	(126, 32, '2', 'false'),
	(127, 32, '7', 'false'),
	(128, 32, '9  ', 'true'),
	(129, 33, 'To determine machine resource allocation among processes.', 'false'),
	(130, 33, 'To sort and organize tasks within a folder.', 'false'),
	(131, 33, 'To create job dependencies that must be completed before new job execution.', 'false'),
	(132, 33, 'To determine which processes should be executed first when dealing with multiple jobs. ', 'true'),
	(133, 34, 'UiPath.RemoteDebugging.Agent.exe start --port --password --verbose', 'false'),
	(134, 34, 'UiPath.RemoteDebugging.Agent.exe enable --port --password --verbose', 'true'),
	(135, 34, 'UiPath.RemoteDebugging.Agent.exe enable --port --username --password --verbose', 'false'),
	(136, 34, 'dotnet ./UiPath.RemoteDebugging.Agent.dll enable --port --password --verbose ', 'false'),
	(137, 35, 'Administrator privileges are not required for installing UiPath Studio.', 'false'),
	(138, 35, 'Administrator privileges are required for installing the robot in both service mode and user mode.', 'false'),
	(139, 35, 'Administrator privileges are required for installing the robot in user mode.', 'false'),
	(140, 35, 'Administrator privileges are required for installing the robot in service mode.', 'true'),
	(141, 36, 'In the Finally section of the Try Catch activity in the End Process state.', 'false'),
	(142, 36, 'In the Try section of the Try Catch activity in the End Process state.', 'false'),
	(143, 36, 'In the Try and Catches sections of the Try Catch activity in the Process Transaction state.', 'true'),
	(144, 36, 'In the Try section of the Try Catch activity in the Process Transaction state. ', 'false'),
	(145, 37, 'Invoke Process XAML file', 'false'),
	(146, 37, 'Invoke SetTransactionStatus XAML file', 'false'),
	(147, 37, 'Invoke Main XAML file', 'false'),
	(148, 37, 'Invoke InitAllSettings XAML file ', 'true'),
	(149, 38, '5', 'false'),
	(150, 38, '10', 'true'),
	(151, 38, '80', 'false'),
	(152, 38, 'null', 'false'),
	(153, 39, 'It enables you to sort the displayed data based on job priorities.', 'false'),
	(154, 39, 'It allows you to choose between background and foreground processes for the displayed data.', 'false'),
	(155, 39, 'It allows you to allocate licenses per machine for the displayed data.', 'false'),
	(156, 39, 'It allows you to control the granularity of the displayed data and check the health of your system in either the last day or the last hour.', 'true'),
	(157, 40, 'The transaction will not be retried.', 'true'),
	(158, 40, 'The transaction will be retried only one time.', 'false'),
	(159, 40, 'The transaction will be retried 2 times.', 'false'),
	(160, 40, 'The transaction will be retried multiple times, until it will be processed successfully. ', 'false'),
	(161, 41, 'Provide a mechanism for subscribing to specific events from third-party applications, automatically starting processes in Orchestrator.', 'true'),
	(162, 41, 'Assist in the creation of automation projects by providing event-based activities.', 'false'),
	(163, 41, 'Manage connections between UiPath Studio and third-party applications.', 'false'),
	(164, 41, 'Provide a mechanism for starting processes on a scheduled basis from Orchestrator. ', 'false'),
	(165, 42, 'Can have only one initial state and multiple final states.', 'true'),
	(166, 42, 'Can have only one initial state and only one final state.', 'false'),
	(167, 42, 'Can have multiple initial states and multiple final states.', 'false'),
	(168, 42, 'Can have multiple initial states and only one final state.', 'false'),
	(169, 43, 'Build a script that compares current CPU usage values to a threshold and clears data as needed.', 'false'),
	(170, 43, 'After every transaction, clear the transaction data, close the applications, and re-open the applications.', 'false'),
	(171, 43, 'Add a "Clear Collection" activity at the beginning of the Process.xaml workflow.', 'false'),
	(242, 61, 'Flowchart', 'false'),
	(172, 43, 'All "Invoke Workflow File" activities from the Main.xaml file should be marked with the Isolated option', 'true'),
	(173, 44, 'If(condition1, valueIfTrue) ElseIf(valueIfFalse)', 'false'),
	(174, 44, 'valueIfTrue If condition1 Else valueIfFalse', 'false'),
	(175, 44, 'If condition1 Then valueIfTrue Elself valueIfFalse', 'false'),
	(176, 44, 'If(condition1, valueIfTrue, valueIfFalse) ', 'true'),
	(177, 45, 'Postpone', 'false'),
	(178, 45, 'Reference', 'true'),
	(179, 45, 'ItemInformation', 'false'),
	(180, 45, 'Deadline ', 'false'),
	(181, 46, 'BusinessRuleException', 'true'),
	(182, 46, 'NullReferenceException', 'false'),
	(183, 46, 'ApplicationException', 'false'),
	(184, 46, 'SystemException', 'false'),
	(185, 47, 'Connectors, API Tokens, Triggers.', 'false'),
	(186, 47, 'Connectors, Connections, Orchestrator.', 'false'),
	(187, 47, 'Connectors, Connections, Triggers.', 'true'),
	(188, 47, 'Activities, Connections, Triggers. ', 'false'),
	(189, 48, 'In the Design ribbon tab, click on the "Publish" button. > Fill in the necessary publishing details, such as the project name, version, and description. > Choose the desired publishing option, such as Orchestrator, Local, or Custom NuGet feed. > Click on the "Publish" button to initiate the publishing process.', 'false'),
	(190, 48, 'Click on the "Publish" button to initiate the publishing process. > In the Design ribbon tab, click on the "Publish" button. > Choose the desired publishing option, such as Orchestrator, Local, or Custom NuGet feed. > Fill in the necessary publishing details, such as the project name, version, and description.', 'false'),
	(191, 48, 'In the Design ribbon tab, click on the "Publish" button. > Choose the desired publishing option, such as Orchestrator, Local, or Custom NuGet feed. > Fill in the necessary publishing details, such as the project name, version, and description. > Click on the "Publish" button to initiate the publishing process.', 'true'),
	(192, 48, 'Fill in the necessary publishing details, such as the project name, version, and description. > In the Design ribbon tab, click on the "Publish" button. > Click on the "Publish" button to initiate the publishing process. > Choose the desired publishing option, such as Orchestrator, Local, or Custom NuGet feed.', 'false'),
	(193, 49, 'System.Collections.Generic.Dictionary', 'false'),
	(194, 49, 'System.Collections.Generic.List', 'false'),
	(195, 49, 'System.Array', 'true'),
	(196, 49, 'System.Data.DataTable ', 'false'),
	(197, 50, 'https://server.uipath.com/', 'false'),
	(198, 50, 'https://computervision.uipath.com/', 'false'),
	(199, 50, 'https://cvserver.uipath.com/', 'false'),
	(200, 50, 'https://cv.uipath.com/', 'true'),
	(201, 51, '1 time.', 'false'),
	(202, 51, '2 times.', 'true'),
	(203, 51, 'The process will not enter the Get Transaction Data state because a linear process is not transactional.', 'false'),
	(204, 51, 'Until there are no more queue items left unprocessed in Orchestrator. ', 'false'),
	(205, 52, 'Business Exception', 'true'),
	(206, 52, 'Application Exception', 'false'),
	(207, 52, 'Fatal Exception', 'false'),
	(208, 52, 'System Exception', 'false'),
	(209, 53, 'Navigate to Tenant > Folders, click the Personal Workspaces tab, and then click Manage Resources for the desired workspace.', 'false'),
	(210, 53, 'Navigate to Tenant > Folders, click the All Workspaces tab, and then click Check Resources for the desired workspace.', 'false'),
	(211, 53, 'Navigate to Tenant > Users, click the Personal Workspaces tab, and then click Resources for the desired workspace.', 'false'),
	(212, 53, 'Navigate to Tenant > Folders, click the Personal Workspaces tab, and then click See Usage for the desired workspace.', 'true'),
	(213, 54, 'They are removed from the project.', 'false'),
	(214, 54, 'They are automatically resolved.', 'false'),
	(215, 54, 'They are replaced with compatible alternatives.', 'false'),
	(216, 54, 'They are marked as unresolved.', 'true'),
	(217, 55, 'Retrieve the X-UiPath-Signature HTTP header. > Compute the hash using SHA256 and the signing key (UTF-8 encoded). > To obtain the raw signature bytes, decode the value of the header from Base64. > Compare the computed signature to the value from X-UiPath-Signature HTTP header.', 'false'),
	(218, 55, 'To obtain the raw signature bytes, decode the value of the header from Base64. > Retrieve the X-UiPath-Signature HTTP header. > Compare the computed signature to the value from X-UiPath-Signature HTTP header. > Compute the hash using SHA256 and the signing key (UTF-8 encoded).', 'false'),
	(219, 55, 'Retrieve the X-UiPath-Signature HTTP header. > To obtain the raw signature bytes, decode the value of the header from Base64. > Compute the hash using SHA256 and the signing key (UTF-8 encoded). > Compare the computed signature to the value from X-UiPath-Signature HTTP header.', 'false'),
	(220, 55, 'Compare the computed signature to the value from X-UiPath-Signature HTTP header. > Retrieve the X-UiPath-Signature HTTP header. > To obtain the raw signature bytes, decode the value of the header from Base64. > Compute the hash using SHA256 and the signing key (UTF-8 encoded).', 'false'),
	(221, 56, 'Utilize a DataTable variable to store and process the tabular data.', 'true'),
	(222, 56, 'Save the tabular data in multiple CSV files for easier manipulation.', 'false'),
	(223, 56, 'Use separate variables to store each column of the tabular data.', 'false'),
	(224, 56, 'Implement custom activities to handle the tabular data. ', 'false'),
	(225, 57, 'To store non-sensitive data and configuration settings for UiPath Studio projects.', 'false'),
	(226, 57, 'To store Orchestrator event logs and related data for auditing purposes.', 'false'),
	(227, 57, 'To securely store sensitive data such as Robot credentials and Credential Assets for use in automation processes.', 'true'),
	(228, 57, 'To serve as a centralized location for storing pre-built automation workflows and processes.', 'false'),
	(229, 58, 'The Attended Robot installation package installs only the UiPath Robot.', 'false'),
	(230, 58, 'The Unattended Robot installation package installs only UiPath Studio, Assistant, and Robot.', 'false'),
	(231, 58, 'The Attended Robot installation package installs only UiPath Studio, and Robot.', 'false'),
	(232, 58, 'The Automation Developer installation package installs only UiPath Studio, Assistant, and Robot', 'true'),
	(233, 59, 'Initialization -> Get Transaction Data -> Process Transaction -> End Process', 'true'),
	(234, 59, 'Initialization -> Get Transaction Data -> End Process', 'false'),
	(235, 59, 'Initialization -> Process Transaction -> End Process', 'false'),
	(236, 59, 'Initialization -> End Process', 'false'),
	(237, 60, 'QueueItem', 'false'),
	(238, 60, 'Object', 'false'),
	(239, 60, 'Dictionary', 'true'),
	(240, 60, 'Item', 'false'),
	(241, 61, 'Sequence', 'false'),
	(243, 61, 'Global Exception Handler', 'false'),
	(244, 61, 'State Machine', 'true'),
	(245, 62, 'dt.AsEnumerable. Max(Function(x) Convert.ToInt32(x("Quantity").ToString))', 'false'),
	(246, 62, 'dt.AsEnumerable. Max(Function(x) Convert.ToInt32(x("Quantity").ToString))("Item")', 'false'),
	(247, 62, 'dt.AsEnumerable. GroupBy(Function(x) x("Item").ToString). Max(Function(x) x.Sum(Function(y) Convert.ToInt32(y("Quantity").ToString)))', 'true'),
	(248, 62, 'dt.AsEnumerable. OrderByDescending(Function(x) Convert.ToInt32(x("Quantity").ToString)). First.Item("Quantity")', 'false'),
	(249, 63, 'Invokes VB.NET or C# code, optionally passing it a list of input arguments.', 'true'),
	(250, 63, 'Invokes VB.NET or Java code, optionally passing it a list of input arguments.', 'false'),
	(251, 63, 'Invokes VB.NET code, optionally passing it a list of input arguments.', 'false'),
	(252, 63, 'Invokes Java code, optionally passing it a list of input arguments.', 'false'),
	(253, 64, 'The owner of the initial workspace and the admin user are added by default to the newly created folder and assigned the Personal Workspace Administrator role.', 'true'),
	(254, 64, 'The owner of the initial workspace is added by default to the newly created folder and assigned the Folder Administrator role.', 'false'),
	(255, 64, 'The owner of the initial workspace loses access to the newly created folder and the existing admin users are added by default.', 'false'),
	(256, 64, 'The admin user is added by default to the newly created folder with the User Administrator role. ', 'false'),
	(257, 65, 'Whenever an exception is caught in a Catch block.', 'false'),
	(258, 65, 'Whenever data is fetched from external sources.', 'true'),
	(259, 65, 'Whenever an argument or value is used.', 'false'),
	(260, 65, 'Whenever the robot encounters an error on a Queue Item. ', 'false'),
	(261, 66, 'DateTime.SubtractHours(CurrentDate, 12).Hour', 'false'),
	(262, 66, 'CurrentDate.AddHours(–12).Hour', 'true'),
	(263, 66, 'CurrentDate SubtractHours(12).Hour', 'false'),
	(264, 66, 'DateTime.AddHours(CurrentDate, –12).Hour', 'false'),
	(265, 67, 'System.Data DataTable', 'false'),
	(266, 67, 'UiPath.Core.QueueItem', 'false'),
	(267, 67, 'System.Data.DataRow', 'true'),
	(268, 67, 'System.Data.DataRow[] ', 'false'),
	(269, 68, 'Native', 'false'),
	(270, 68, 'Text attribute', 'false'),
	(271, 68, 'Default', 'false'),
	(272, 68, 'Full text ', 'true'),
	(273, 69, 'A panel that displays summaries of the alerts you subscribed to, received as error reports every ten minutes, or as daily reports.', 'false'),
	(274, 69, 'A panel that displays alerts as they occur.', 'false'),
	(275, 69, 'A panel that displays a more comprehensive list of all alerts.', 'false'),
	(276, 69, 'A panel that displays the most severe five alerts, accessible from the Alerts bell. ', 'true'),
	(277, 70, 'The Object Repository cannot be passed between a Process and a Library.', 'false'),
	(278, 70, 'The Object Repository is only available in a Library.', 'false'),
	(279, 70, 'The Object Repository needs to be exported as a UI Library and imported in the Process for it to become available.', 'false'),
	(280, 70, 'The Object Repository will automatically be available in the Process. ', 'true'),
	(281, 71, 'A duplicated UI can be selected, and the copy is modified in the automation process.', 'false'),
	(282, 71, 'A portion of the application UI can be selected, which is helpful when dealing with multiple fields bearing the same label.', 'true'),
	(283, 71, 'The selected area is automatically resized to fit all UI elements within it.', 'false'),
	(284, 71, 'The selected area is treated as a single UI element, with no further analysis of its contents.', 'false'),
	(285, 72, 'By standardizing authorization and authentication, managing API connections, and enabling faster integration into SaaS platforms.', 'true'),
	(286, 72, 'By substituting the requirement for API automation with UI automation capabilities, delivering a more manageable and user-friendly approach, allowing users to streamline their processes efficiently and effectively facilitating a more rapid integration process.', 'false'),
	(287, 72, 'By offering a comprehensive, unified platform dedicated solely to UI automation, enabling seamless integration with third-party applications.', 'false'),
	(288, 72, 'By enabling developers to create custom UI elements for applications without using APIs. ', 'false'),
	(289, 73, 'Input Arguments, Output Arguments, and Variables.', 'false'),
	(290, 73, 'Sequence, Flowchart, and Transactional Business Process.', 'false'),
	(291, 73, 'Entry, Exit, and Transition Actions with Trigger Conditions.', 'true'),
	(292, 73, 'Activities, Connectors, and Annotations. ', 'false'),
	(293, 74, 'String.Join(“,”, UserNames)', 'true'),
	(294, 74, 'String.Concat(UserNames, “,”)', 'false'),
	(295, 74, 'String.Concat(“,”, UserNames)', 'false'),
	(296, 74, 'String.Join(UserNames, “,”) ', 'false'),
	(297, 75, 'Use Foreground', 'true'),
	(298, 75, 'Activate', 'false'),
	(299, 75, 'Maximize Window', 'false'),
	(300, 75, 'Set Focus ', 'false'),
	(301, 76, 'Transaction is retried only one time', 'false'),
	(302, 76, 'Transaction is not retried but remaining transactions continue processing', 'true'),
	(303, 76, 'Transaction is not retried and the process stops.', 'false'),
	(304, 76, 'Transaction is retried multiple times until processed successfully. ', 'false'),
	(305, 77, 'Open in UiExplorer, Copy to clipboard, Show all matches.', 'true'),
	(306, 77, 'Accuracy, Open in UiExplorer, Copy to clipboard, Show all matches.', 'false'),
	(307, 77, 'Ignore text, Copy to clipboard, Show all matches.', 'false'),
	(308, 77, 'Refresh, Open in UiExplorer, Copy to clipboard.', 'false'),
	(309, 78, 'Input Element', 'false'),
	(310, 78, 'Selector', 'false'),
	(311, 78, 'Activate', 'true'),
	(312, 78, 'Delay before', 'false'),
	(313, 79, 'Connections establish tasks and exchanges based on a connector’s compatibility with the external application.', 'false'),
	(314, 79, 'Connections establish tasks and exchanges between users and external applications using the server-side triggers.', 'false'),
	(315, 79, 'Connections establish tasks and exchanges between users and external applications using the authentication process of the UI automation provider.', 'false'),
	(316, 79, 'Connections establish tasks and exchanges between users and external applications using the authentication process of the API provider.', 'true'),
	(317, 80, 'Retried', 'false'),
	(318, 80, 'Abandoned', 'false'),
	(319, 80, 'Postponed', 'false'),
	(320, 80, 'Failed', 'true'),
	(321, 81, 'Windows Messages only.', 'true'),
	(322, 81, 'Same as App/Browser and Simulate.', 'false'),
	(323, 81, 'Simulate and Window Messages.', 'false'),
	(324, 81, 'Simulate only. ', 'false'),
	(325, 82, 'Add Log Fields', 'true'),
	(326, 82, 'Update Logs', 'false'),
	(327, 82, 'Add Custom Log', 'false'),
	(328, 82, 'Build Log', 'false'),
	(329, 83, 'Reducing the need for Ul and API automation, allowing developers to work exclusively with connectors.', 'false'),
	(330, 83, 'Providing a fully customizable catalog of connectors for developing proprietary applications.', 'false'),
	(331, 83, 'Replacing all types of authorization and authentication protocols with a single, standardized method.', 'false'),
	(332, 83, 'Simplified integration with popular applications, faster deployment, and integration across all UiPath Platform product solutions.', 'true'),
	(333, 84, 'DateTime.ParseExact(DateString, “mm/dd/yyyy HH:mm:ss”, CultureInfo.InvariantCultue}', 'false'),
	(334, 84, 'DateTime.ParseExact(DateString, “dd/MM/yyyy HH:mm:ss”, CultureInfo.InvariantCulture}', 'true'),
	(335, 84, 'DateTime.ParseExact(DateString, “dd/MM/yyyy hh:mm:ss”, CultureInfo.InvariantCulture}', 'false'),
	(336, 84, 'DateTime.ParseExact(DateString, “MM/dd/yyyy hh:mm:ss”, CultureInfo.InvariantCultue}', 'false'),
	(337, 85, 'Settings sheet contains Credential Assets stored in Orchestrator. Assets sheet contains hard-coded values.', 'false'),
	(338, 85, 'Settings sheet contains only values used for the initialization of applications. Assets sheet contains only Credential Assets stored in Orchestrator', 'false'),
	(339, 85, 'Settings sheet contains hard-coded values. Assets sheet contains all names of Orchestrator Assets except those of type Credential', 'true'),
	(340, 85, 'Settings sheet contains hard-coded values. Assets sheet contains all names of Orchestrator Assets including those of type Credential', 'false'),
	(341, 86, 'When an Exception is caught and handled.', 'false'),
	(342, 86, 'When a Remove Log Fields activity is used to remove them.', 'true'),
	(343, 86, 'When a Log Message activity is executed with Log Level = Warm or higher.', 'false'),
	(344, 86, 'When the first Log Message activity is executed.', 'false'),
	(345, 87, 'When initiating the first state of a state machine.', 'false'),
	(346, 87, 'When marking the successful completion or termination of a state machine’s execution.', 'true'),
	(347, 87, 'When an intermediary state has multiple possible transitions.', 'false'),
	(348, 87, 'When a particular state contains complex conditional logic. ', 'false'),
	(349, 88, 'OutputFileName argument is optional.', 'false'),
	(350, 88, 'Password-protected PDF files cannot be processed with this activity,', 'false'),
	(351, 88, 'PageCount argument outputs the number of extracted pages.', 'false'),
	(352, 88, 'Range argument accepts complex range values or “All”.', 'true'),
	(353, 89, 'Select or clear a check box. Send keyboard shortcuts using your keyboard. Select an item from a drop-down.', 'false'),
	(354, 89, 'Copy text using the Get Text activity. Hover over an element using the Hover activity. Highlight an element using the Highlight activity.', 'true'),
	(355, 89, 'Copy text using the Get Text activity. Hover over an element using the Hover activity. Click on buttons, links, and other clickable elements such as icons or images. Type text in a text area such as a text box. Select or clear a check box.', 'false'),
	(356, 89, 'Click on buttons, links, and other clickable elements such as icons or images. Type text in a text area such as a text box Select or clear a check box. Send keyboard shortcuts using your keyboard. Select an item from a drop-down. ', 'false'),
	(357, 90, 'CyberArk CCP, Cisco, Google Credentials, CyberArk, Azure Key Vault.', 'false'),
	(358, 90, 'CyberArk CCP, Azure Key Vault, Google Credentials, Amazon Security Services.', 'false'),
	(359, 90, 'Azure Key Vault, CyberArk CCP, HashCorp Vault, Thycotic Secret Server, BeyondTrust, CyberArk.', 'true'),
	(360, 90, 'Cisco, Amazon Security Services, Google Credentials, Microsoft SCS, IBM Vault.', 'false'),
	(361, 91, 'A State Machine is composed of States, Triggers, and Loops.', 'false'),
	(362, 91, 'A State Machine comprises three main components: Sequences, Flowcharts, and Input/Output Arguments.', 'false'),
	(363, 91, 'A State Machine is made up of States, Transitions, Entry Actions, and Exit Actions.', 'true'),
	(364, 91, 'A State Machine consists of four primary components: States, Triggers, Transitions, and Actions.', 'false'),
	(365, 92, 'Invoke InitAllSettings XAML file in Given.', 'true'),
	(366, 92, 'Invoke KillAllProcesses XAML file in Given.', 'false'),
	(367, 92, 'Invoke SetTransactionStatus XAML file in Given.', 'false'),
	(368, 92, 'Invoke CloseAllApplications XAML file in Given.', 'false'),
	(369, 93, 'It allows you to select whether the contents of the selected folder’s subfolders are displayed.', 'true'),
	(370, 93, 'It enables you to sort the displayed data based on job priorities.', 'false'),
	(371, 93, 'It allows you to allocate licenses per machine for the displayed data.', 'false'),
	(372, 93, 'It allows you to choose between background and foreground processes for the displayed data. ', 'false'),
	(373, 94, 'GroupBy', 'false'),
	(374, 94, 'Where', 'true'),
	(375, 94, 'OrderBy', 'false'),
	(376, 94, 'Select', 'false'),
	(377, 95, 'It facilitates the communication between a remote application or desktop and the dedicated UiPath extension, allowing selectors to be natively generated in UiExplorer.', 'true'),
	(378, 95, 'It enables the use of OCR and image recognition activities on remote applications or desktops, without any extensions, allowing selectors to be natively generated in UiExplorer.', 'false'),
	(379, 95, 'It introduces support for headless browser automation, so browser automation doesn''t necessarily have to rely on visual elements on screen, such as window frames.', 'false'),
	(380, 95, 'It allows automatons to run on the user machine, in a different Windows session.', 'false'),
	(381, 96, 'Studio, the remote robot, and Orchestrator are running version 2021.10 or later.', 'false'),
	(382, 96, 'The same user must be signed in Studio and the remote robot.', 'false'),
	(383, 96, 'Studio and the remote robot must be connected to the same Orchestrator tenant.', 'false'),
	(384, 96, 'TCP/IP connectivity exists between the Studio machine and the remote machine. ', 'true'),
	(385, 97, '0', 'false'),
	(386, 97, '2', 'true'),
	(387, 97, 'Object reference not set to an instance exception is thrown', 'false'),
	(388, 97, 'System Argument Exception is thrown  ', 'false'),
	(389, 98, 'Data Service', 'false'),
	(390, 98, 'Data Service with Filter', 'false'),
	(391, 98, 'File', 'true'),
	(392, 98, 'Test Data Queue ', 'false'),
	(393, 99, 'To capture all elements of an application from multiple screens simultaneously using the Computer Vision technology.', 'false'),
	(561, 141, 'Object Repository coverage', 'false'),
	(394, 99, 'To capture ail the available elements of an application using the Computer Vision technology', 'true'),
	(395, 99, 'To capture the selected elements of an application using the Computer Vision technology.', 'false'),
	(396, 99, 'To capture the selected elements of an application from multiple screens simultaneously using the Computer Vision technology. ', 'false'),
	(397, 100, 'Initialization', 'false'),
	(398, 100, 'End Process', 'false'),
	(399, 100, 'Get Transaction Data', 'true'),
	(400, 100, 'Process Transaction', 'false'),
	(401, 101, 'Only the Verify Expression activity will be added to the mock file.', 'false'),
	(402, 101, 'The changes made in “MySequence” workflow file are applied to the mock file.', 'false'),
	(403, 101, 'Only the Log Message activity will be added to the mock file.', 'false'),
	(404, 101, 'The changes made in “MySequence” workflow file are not applied to the mock file.', 'true'),
	(405, 102, 'One Application Two Screens Five UI Elements', 'true'),
	(406, 102, 'One Screen Two Applications Five UI Elements', 'false'),
	(407, 102, 'One Application Two UI Elements Five Screens', 'false'),
	(408, 102, 'One Library One Application Two Screens Five UI Elements ', 'false'),
	(409, 103, 'Invoke Method activity will throw an error.', 'false'),
	(410, 103, 'Colors will contain items in the following order: “Red”, “Green”, “Yellow”.', 'true'),
	(411, 103, 'Colors will contain items in the following order: “Yellow:”, “Red”, “Green”.', 'false'),
	(412, 103, 'Colors will contain items in the following order: “Red”, “Green”  ', 'false'),
	(413, 104, 'A runtime error occurs and the Finally block is not executed.', 'true'),
	(414, 104, 'The Finally block is executed and the Catches section catches the exception.', 'false'),
	(415, 104, 'No exception is thrown and the Finally block executes.', 'false'),
	(416, 104, 'No exceptions are happening and the workflow continues to execute.', 'false'),
	(417, 105, 'The flow will use the value from the Settings sheets since the asset is missing.', 'true'),
	(418, 105, 'The “OrchestratorQueueName” key is not added to the config dictionary and the flow will throw in Get Transaction Data workflow.', 'false'),
	(419, 105, 'The flow will throw an exception in initAllSettings workflow.', 'false'),
	(420, 105, 'An empty string will be saved for the “OrchestratorQueueName" key in the config dictionary. ', 'false'),
	(421, 106, 'dtEmployee.Select("([Department]=''IT'' AND [Department]=''Finance'') AND [Salary] < 30000")', 'false'),
	(422, 106, 'dtEmployee.Select("[Department]=''IT OR [Department]=''Finance'' OR [Salary] < 30000")', 'false'),
	(423, 106, 'dtEmployee.Select("[Department]=''IT'' AND [Department]= ''Finance'' AND [Salary] < 30000")', 'false'),
	(424, 106, 'dtEmployee.Select("([Department]=''IT''OR [Department]=''Finance'') AND [Salary] < 30000")', 'true'),
	(425, 107, 'Element is clicked once the element is fully loaded.', 'true'),
	(426, 107, 'Continues to the next activity after 30 seconds without clicking on the element.', 'false'),
	(427, 107, 'Waits 10 seconds before clicking on the element.', 'false'),
	(428, 107, 'Timeout error occurs without clicking on the element.  ', 'false'),
	(429, 108, 'ApplicationNotFoundException', 'true'),
	(430, 108, 'SelectorNotFoundException', 'false'),
	(431, 108, 'Try', 'false'),
	(432, 108, 'Exception', 'false'),
	(433, 109, 'DataRow[]', 'false'),
	(434, 109, 'DataRow', 'true'),
	(435, 109, 'List<DataRow>', 'false'),
	(436, 109, 'QueueItem', 'false'),
	(437, 110, 'dt.AsEnumerable.Where(Function(x)x(“Item”).ToString.Equals(“strawberry”))', 'false'),
	(438, 110, 'dt.AsEnumerable.Any(Function(x)x(“Item”).ToString.Equals(“strawberry”))', 'false'),
	(439, 110, 'dt.AsEnumerable.FirstOrDefault(Function(x)x(“Item”).ToString.Equals(“strawberry”))', 'false'),
	(440, 110, 'dt.AsEnumerable.First(Function(x)x(“Item”).ToString.Equals(“strawberry”)) ', 'true'),
	(441, 111, 'Utilizing LINQ to find the total sum of integers in a list by writing listOfIntegers.Sum(Function(x) x).', 'true'),
	(442, 111, 'Applying LINQ to filter out emails in a list of strings containing multiple email addresses by writing listOfStrings.FilterEmails().ToList().', 'false'),
	(443, 111, 'Employing LINQ to convert DataTable to JSON format by writing dataTable.ToJSON().', 'false'),
	(444, 111, 'Using LINQ to identify the longest string in a list of strings by writing listOfStrings.Max(Function(x)x.Length()).', 'false'),
	(445, 112, 'Job Execution Order', 'false'),
	(446, 112, 'Job Queuing Strategy', 'false'),
	(447, 112, 'Job Dependency Settings', 'false'),
	(448, 112, 'Job Priority Levels', 'true'),
	(449, 113, 'InitAllApplications.xaml', 'true'),
	(450, 113, 'InitAllSettings.xaml', 'false'),
	(451, 113, 'Process.xaml', 'false'),
	(452, 113, 'FirstRun.xaml ', 'false'),
	(453, 114, 'A process may be turned into a Background Process by adding a “Background” tag to the process name as long as it does/does not contain Ui interaction. You need to go to the Project Settings and modify the name of the process.', 'false'),
	(454, 114, 'A process may be turned into a Background Process as long as it does not contain persistence activities. You need to go to the Project Settings window and set the Supports Persistence toggle to No.', 'false'),
	(455, 114, 'A process may be turned into a Background Process by just deleting the UiAutomation package dependency as long as it does/does not contain UI interaction.', 'false'),
	(456, 114, 'A process may be turned into a Background Process as long as it does not contain activities with UI interaction. You need to go to the Project Settings window and set the Starts in Background toggle to Yes. ', 'true'),
	(457, 115, 'By sending customer feedback to UiPath developers.', 'false'),
	(458, 115, 'Through proactive monitoring and alerting of detected issues.', 'true'),
	(459, 115, 'With immediate technical support for any detected issue.', 'false'),
	(460, 115, 'By automatically updating background processes.', 'false'),
	(461, 116, 'Local elements and library elements.', 'true'),
	(462, 116, 'Dynamic elements and static elements.', 'false'),
	(463, 116, 'Web elements and mobile elements.', 'false'),
	(464, 116, 'UI elements and non-UI elements. ', 'false'),
	(465, 117, 'message = if(number mod 2 = 0, “Even number”, “Odd number”)', 'true'),
	(466, 117, 'message = if(number mod 2 = 0, Odd number, Even number)', 'false'),
	(467, 117, 'message = if(number mod 2 = 0 then “Odd number” else “Even number”)', 'false'),
	(468, 117, 'message = if(number mod 2 = 0, {“Odd number”} else {Even number”}) ', 'false'),
	(469, 118, 'To start UiPath processes only when users interact with specific UI elements.', 'false'),
	(470, 118, 'To manage API connections and authorize usage across different security protocols.', 'false'),
	(471, 118, 'To notify users when a new connector is available in the UiPath Integration Service catalog.', 'false'),
	(472, 118, 'To start UiPath processes by configuring events such as data updates, insertions or deletions in other systems.', 'true'),
	(473, 119, 'An error rooted in a technical issue, such as an application that is not responding.', 'true'),
	(474, 119, 'An error caused by using different data types than the expected ones in an application.', 'false'),
	(475, 119, 'An error that occurs when the application is running on unstable environment.', 'false'),
	(476, 119, 'An error rooted in the fact that certain data which the automation project depends on is incomplete or missing.', 'false'),
	(477, 120, 'Process Transaction only.', 'false'),
	(478, 120, 'Get Transaction Data and Process Transaction.', 'true'),
	(479, 120, 'Initialization and Process Transaction.', 'false'),
	(480, 120, 'Initialization and Get Transaction Data.', 'false'),
	(481, 121, 'They are stored in a dedicated folder for mock testing configuration.', 'false'),
	(482, 121, 'They are stored in a separate folder called “Mocks”.', 'true'),
	(483, 121, 'They are stored in the same folder as the source workflow.', 'false'),
	(484, 121, 'They are stored in a nested structure based on the source workflow’s file tree.', 'false'),
	(485, 122, 'Every time data is read from external sources.', 'true'),
	(486, 122, 'Every time an exception is caught in a Catch block.', 'false'),
	(487, 122, 'Every time a variable or argument value is used.', 'false'),
	(488, 122, 'Every time the robot encounters an error processing a Queue Item.', 'false'),
	(489, 123, 'Value: 4 Data Type: Object', 'false'),
	(490, 123, 'Value: 7 Data Type: String', 'false'),
	(491, 123, 'Value: 4 Data Type: String', 'true'),
	(492, 123, 'Value: 7 Data Type: Object', 'false'),
	(493, 124, 'Locals Panel and Watch Panel.', 'false'),
	(494, 124, 'Immediate Panel and Watch Panel.', 'false'),
	(495, 124, 'Watch Panel and Breakpoint Panel.', 'false'),
	(496, 124, 'Locals Panel and Immediate Panel. ', 'true'),
	(497, 125, 'The Flow Switch activity is designed solely for usage in sequence workflows.', 'false'),
	(498, 125, 'Two default cases can be assigned in the Default section.', 'false'),
	(499, 125, 'The default TypeArgument property for the Flow Switch activity is set to Int32.', 'true'),
	(500, 125, 'Default cases can be numbered. ', 'false'),
	(501, 126, '2:20 PM', 'false'),
	(502, 126, '2:25 PM', 'true'),
	(503, 126, '2:05 PM', 'false'),
	(504, 126, '2:28 PM ', 'false'),
	(505, 127, 'Then', 'false'),
	(506, 127, 'Setup', 'false'),
	(507, 127, 'When', 'true'),
	(508, 127, 'Given ', 'false'),
	(509, 128, 'Deselect at end.', 'true'),
	(510, 128, 'Alter disabled element.', 'false'),
	(511, 128, 'Activate.', 'false'),
	(512, 128, 'Click before typing. ', 'false'),
	(513, 129, 'Both the service and the user modes are recommended for running unattended automations.', 'false'),
	(514, 129, 'The service mode is the recommended option for running unattended automations.', 'true'),
	(515, 129, 'Both the service and the user modes are recommended for creating and testing automations, and running attended automations.', 'false'),
	(516, 129, 'The service mode is the recommended option for creating and testing automations, and running attended automations. ', 'false'),
	(517, 130, 'To compare the size and position of UI elements in different applications.', 'false'),
	(518, 130, 'To synchronize the timing of multiple Computer Vision activities in the same project.', 'false'),
	(519, 130, 'To configure the target as being relative to an element, either a single point or an area selection in the application.', 'true'),
	(520, 130, 'To create a fixed relationship between Computer Vision actions and UI element positions.', 'false'),
	(521, 131, 'Verify if a certain application is open in the execution environment.', 'false'),
	(522, 131, 'Verify the naming of a certain key present in the ‘Config’ dictionary.', 'false'),
	(523, 131, 'Verify the variable type for the ‘Config’ dictionary.', 'false'),
	(524, 131, 'Verify if a certain key is present in the ‘Config’ dictionary. ', 'true'),
	(525, 132, 'Only in the RetryCurrentTransaction.xaml workflow.', 'false'),
	(526, 132, 'In the End Process state in the Finally section of the Try Catch activity.', 'false'),
	(527, 132, 'In the RetryCurrentTransaction.xaml workflow and in the Process.xaml workflow.', 'false'),
	(528, 132, 'In the RetryCurrentTransaction.xaml workflow and in the SetTransactionStatus.xaml workflow. ', 'true'),
	(529, 133, 'Click activity', 'true'),
	(530, 133, 'Invoke workflow activity', 'false'),
	(531, 133, 'If activity', 'false'),
	(532, 133, 'Assign activity', 'false'),
	(533, 134, 'apple, pear, orange', 'false'),
	(534, 134, 'apple, pear, orange, mango, kiwi', 'true'),
	(535, 134, '“apple pear orange”, “mango kiwi”', 'false'),
	(536, 134, 'apple pear orange, mango kiwi ', 'false'),
	(537, 135, 'In an Orchestrator Credential asset and referenced in the Assets sheet in the Config.xisx file.', 'false'),
	(538, 135, 'In an Orchestrator Credential asset and referenced in the Settings sheet in the Config.xisx file.', 'true'),
	(539, 135, 'In the Constants sheet in the Config.xisx file with the value of the email address', 'false'),
	(540, 135, 'In an Orchestrator Text asset and referenced in the Assets sheet in the Config.xisx file.', 'false'),
	(541, 136, 'Sequence', 'false'),
	(542, 136, 'Flowchart', 'false'),
	(543, 136, 'State Machine', 'true'),
	(544, 136, 'Global Exception Handler', 'false'),
	(545, 137, 'Array of String', 'false'),
	(546, 137, 'String', 'true'),
	(547, 137, 'Double', 'false'),
	(548, 137, 'Int32 ', 'false'),
	(549, 138, 'MANUAL or AUTOMATIC.', 'false'),
	(550, 138, 'PASS or FAIL', 'true'),
	(551, 138, 'EXPECTED or ACTUAL.', 'false'),
	(552, 138, 'SUCCESS or EXCEPTION.', 'false'),
	(553, 139, 'Because the UiPath Remote Runtime component should be enabled to access the Citrix workspace environment.', 'false'),
	(554, 139, 'Because custom virtual channels are blocked by default, preventing the UiPath Remote Runtime from functioning correctly.', 'true'),
	(555, 139, 'Because the network latency should be decreased and the performance of UiPath automation processes on Citrix should be improved.', 'false'),
	(556, 139, 'Because a secure connection should be created between the UiPath Remote Runtime and the Citrix receiver. ', 'false'),
	(557, 140, 'Input mode = Chromium API', 'false'),
	(558, 140, 'User Data Folder Mode = CustomFolder', 'false'),
	(559, 140, 'Input mode = Simulate', 'true'),
	(560, 140, 'WebDriver mode = Headless ', 'false'),
	(562, 141, 'Test data coverage', 'false'),
	(563, 141, 'Selector coverage', 'false'),
	(564, 141, 'Activity coverage ', 'true'),
	(565, 142, 'By setting the Object Repository Enforced option to Yes in the General tab within the Project Settings window.', 'false'),
	(566, 142, 'By setting the Object Repository Enforced option to Yes in the Design tab within the UiPath Studio Settings window.', 'true'),
	(567, 142, 'By setting the Object Repository Enforced option to Yes in the UI Automation Modern tab within the Project Settings window.', 'false'),
	(568, 142, 'By setting the Object Repository Enforced option to Yes in the System tab within the Project Settings window.', 'false'),
	(569, 143, 'Config(“OrchestratorQueueName”, “ProcessABCQueue”).ToString', 'false'),
	(570, 143, 'Config(“OrchestratorQueueName”).ToString', 'true'),
	(571, 143, 'Config(“ProcessABCQueue”, “OrchestratorQueueName”).ToString', 'false'),
	(572, 143, 'Config(“ProcessABCQueue”).ToString ', 'false'),
	(573, 144, 'Local and Remote.', 'false'),
	(574, 144, 'Scheduled and Unscheduled.', 'false'),
	(575, 144, 'Generic and Predefined.', 'true'),
	(576, 144, 'Basic and Advanced. ', 'false'),
	(577, 145, '(DateTime.Now - DateTime. ParseExact(DateString, “dd MMM yyyy”, Cultureinfo.InvariantCulture)).Days <7', 'false'),
	(578, 145, '(DateTime.Now - DateTime.ParseExact(DateString, “dd MMM yyyy”, Cultureinfo. InvariantCulture)). AddDays(-7) > 0', 'false'),
	(579, 145, '(DateTime.Now - DateTime.ParseExact(DateString, “d MMM yyyy”, Cultureinfo. InvariantCulture)).Days < 7', 'true'),
	(580, 145, 'DateTime.Parse(DateTime.Now - DateString).Days <7', 'false'),
	(581, 146, '4', 'true'),
	(582, 146, '3', 'false'),
	(583, 146, '2', 'false'),
	(584, 146, '5 ', 'false'),
	(585, 147, 'To execute the final state actions before terminating the state machine.', 'false'),
	(586, 147, 'To specify the condition or event that initiates a transition from the current state.', 'true'),
	(587, 147, 'To define the entry actions when transitioning into a state.', 'false'),
	(588, 147, 'To establish the exit actions when moving out of a state.', 'false'),
	(589, 148, 'Get Processes', 'false'),
	(590, 148, 'Use Application/Browser', 'false'),
	(591, 148, 'Check App State', 'true'),
	(592, 148, 'Process Start Trigger', 'false'),
	(593, 149, '1. Remove the Get Transaction Item activity from GetTransactionData workflow. 2. Add a Read Range activity in GetTransactionData workflow to read the data from a local Excel file. 3. Add the logic required to read the data source only one time. 4. Add the logic required to retrieve only one row from read data each time. 5. Add the logic required to check if all rows/transaction items from the read data have been processed.', 'true'),
	(594, 149, '1. Remove the Get Transaction Item activity from GetTransactionData workflow. 2. Add a Read Range activity in GetTransactionData workflow to read the data from a local Excel file. 3. Add the logic required to read the data source only one time. 4. Add the logic required to retrieve only one row from read data each time.', 'false'),
	(595, 149, '1. Remove the Get Transaction Item activity from GetTransactionData workflow. 2. Add a Read Row activity in GetTransactionData workflow to read the data from a local Excel file. 3. Add the logic required to read the data source only one time. 4. Add the logic required to retrieve only one row from read data each time. 5. Add the logic required to check if all rows/transaction items from the read data have been processed.', 'false'),
	(596, 149, '1. Remove the Get Transaction Item activity from GetTransactionData workflow. 2. Add a Read Row activity in GetTransactionData workflow to read the data from a local Excel file. 3. Add the logic required to read the data source only one time. 4. Add the logic required to check if all rows/transaction items from the read data have been processed. ', 'false'),
	(597, 150, 'UiPath RPA Automation', 'true'),
	(598, 150, 'Automation', 'false'),
	(599, 150, 'Automation RPAUiPath RPA', 'false'),
	(600, 150, 'UiPath RPA', 'false'),
	(601, 151, 'Re-executes the activity which threw an exception.', 'false'),
	(602, 151, 'Executes only one activity at a time and then pauses the execution.', 'false'),
	(603, 151, 'Steps out and stops current execution.', 'false'),
	(604, 151, 'Executes activities in the current container and then pauses the execution.', 'true'),
	(605, 152, 'Studio, the remote robot have the same version.', 'false'),
	(606, 152, 'The same user must be signed in Studio and the remote robot.', 'false'),
	(607, 152, 'Studio and the remote robot must be connected to the same Orchestrator tenant.', 'true'),
	(608, 152, 'TCP/IP connectivity exists between the Studio machine and the remote machine. ', 'false'),
	(609, 153, 'Microsoft OCR', 'false'),
	(610, 153, 'UiPath Screen OCR', 'true'),
	(611, 153, 'Microsoft Azure Computer Vision OCR', 'false'),
	(612, 153, 'Tesseract OCR', 'false'),
	(613, 154, 'Entry', 'true'),
	(614, 154, 'Exit', 'false'),
	(615, 154, 'Entry and Transitions', 'false'),
	(616, 154, 'Entry and Exit', 'false'),
	(617, 155, 'Export test data, perform debugging, analyze activity coverage.', 'false'),
	(618, 155, 'Export test data, group tests together, analyze activity coverage.', 'false'),
	(619, 155, 'Perform debugging, analyze activity coverage, group tests together.', 'true'),
	(620, 155, 'Export test results, group tests together, analyze activity coverage. ', 'false'),
	(621, 156, 'Sequential Process', 'true'),
	(622, 156, 'Linear Process', 'false'),
	(623, 156, 'Iterative Process', 'false'),
	(624, 156, 'Transactional Process', 'false'),
	(625, 157, 'RPA Testing', 'false'),
	(626, 157, 'Application Testing', 'false'),
	(627, 157, 'Data-Driven Testing', 'false'),
	(628, 157, 'Mock Testing', 'true'),
	(629, 158, 'Edit on Monitoring and Edit on Jobs.', 'false'),
	(630, 158, 'View On Monitoring and View on Jobs.', 'false'),
	(631, 158, 'Edit on Monitoring and View on Jobs.', 'true'),
	(632, 158, 'View on Monitoring and Edit on Jobs.', 'false'),
	(633, 159, 'Employing AI Computer Vision to identify and interact with Ul elements in a remote desktop application with low quality or scaling issues.', 'true'),
	(634, 159, 'Applying AI Computer Vision to perform sentiment analysis on a provided text string and displaying the result.', 'false'),
	(635, 159, 'Using AI Computer Vision to extract plain text from a scanned PDF document and store the output in a string variable', 'false'),
	(636, 159, 'Utilizing AI Computer Vision to train a custom machine learning model to recognize specific patterns in data.', 'false'),
	(637, 160, 'QueueA from FolderA.', 'false'),
	(638, 160, 'QueueA from Shared.', 'false'),
	(639, 160, 'QueueB from FolderA.', 'false'),
	(640, 160, 'QueueB from Shared.', 'true'),
	(641, 161, 'Service unattended, User remote, Attended, Debugging.', 'false'),
	(642, 161, 'Service unattended, Personal remote, Attended, Development.', 'true'),
	(643, 161, 'Orchestrator unattended, Personal remote, User attended, Studio.', 'false'),
	(644, 161, 'Foreground unattended, Background unattended, Attended, Development. ', 'false'),
	(645, 162, 'Activate', 'false'),
	(646, 162, 'Alter disabled element', 'false'),
	(647, 162, 'Trigger Complete', 'false'),
	(648, 162, 'Deselect at end ', 'true'),
	(649, 163, 'dt.Columns.Select(function(x) x.ColumnName).ToList()', 'false'),
	(650, 163, 'dt.Columns.Cast(Of Datacolumn).Select(function(col) col).ToList()', 'false'),
	(651, 163, 'dt.AsEnumerable.Select(function(x) x.ColumnName).ToList()', 'false'),
	(652, 163, 'dt.Columns.Cast(Of Datacolumn).Select(function(x) x.ColumnName).ToList()', 'true'),
	(653, 164, 'To execute the final actions of the current state before transitioning to the next stage.', 'true'),
	(654, 164, 'To manually stop the state machine''s execution.', 'false'),
	(655, 164, 'To revoke any entry actions performed when entering the current state.', 'false'),
	(656, 164, 'To define the conditions upon which a state transition should occur. ', 'false'),
	(657, 165, 'UiPath.Core.BusinessRuleException', 'false'),
	(658, 165, 'System Exception', 'false'),
	(659, 165, 'System.NullReferenceException', 'false'),
	(660, 165, 'System ApplicationException', 'false'),
	(661, 166, 'Executor directs to the "If in_OrchestratorQ..." activity', 'true'),
	(662, 166, 'Executor directs to the "First Run" sequence', 'false'),
	(663, 166, 'Executor directs to the first InitAllSettings workflow activity', 'false'),
	(664, 166, 'Executor directs to the first activity outside "If first run, read local configuration"', 'false'),
	(665, 167, 'The process will not enter the Get Transaction Data state because a linear process is not transactional.', 'false'),
	(666, 167, 'It should be set to the next queue item in order to be, further on, processed.', 'false'),
	(667, 167, 'It can be set to a static value and, in order to respect the UiPath best practices, this value should be taken from "Config.xlsx".', 'false'),
	(668, 167, 'It should be set to Nothing because a linear process should not enter the second time in the Get Transaction Data state. ', 'true'),
	(669, 168, 'Select Log Activities from the Debug panel.', 'false'),
	(670, 168, 'Set Log Message option in the Breakpoint Settings.', 'true'),
	(671, 168, 'Select Execution Trail from the Debug panel.', 'false'),
	(672, 168, 'Insert a Log Message before each activity with a breakpoint.', 'false'),
	(673, 169, 'errorInfo with the “In” direction result with the “In” direction', 'false'),
	(674, 169, 'errorInfo with the “Out” direction result with the “In/Out” direction', 'false'),
	(675, 169, 'errorInfo with the “In” direction result with the “Out” direction', 'true'),
	(676, 169, 'errorInfo with the “In” direction result with the “In/Out” direction', 'false'),
	(677, 170, '1', 'false'),
	(678, 170, 'Compilation error', 'false'),
	(679, 170, 'Error during runtime', 'false'),
	(680, 170, '0 ', 'true'),
	(681, 171, 'Run Failed Test Cases', 'false'),
	(682, 171, 'Run All In View', 'false'),
	(683, 171, 'Run Passed Test Cases', 'true'),
	(684, 171, 'Run Selected', 'false'),
	(685, 172, 'Successful', 'false'),
	(686, 172, 'Stopped', 'false'),
	(687, 172, 'Faulted', 'true'),
	(688, 172, 'Suspended', 'false'),
	(689, 173, 'aaname=‘FirstName’', 'false'),
	(690, 173, 's', 'true'),
	(691, 173, 'id=‘selMonth’', 'false'),
	(692, 173, 'class=‘down-chevron set-font’ ', 'false'),
	(693, 174, 'Custom log fields are used to automatically retry failed transactions with real-time updates.', 'false'),
	(694, 174, 'Custom log fields are used to define the variable types for transactions, replacing the default QueueItem type.', 'false'),
	(695, 174, 'Custom log fields are used to store sensitive information like credentials and personal data of users.', 'false'),
	(696, 174, 'Custom log fields are included in log messages and used to add more data about each transaction for reporting and troubleshooting purposes.', 'true'),
	(697, 175, 'Perform Remote Debugging allows developers to debug a project on a different machine using a web-based interface.', 'true'),
	(698, 175, 'Perform Remote Debugging enables developers to design new UI elements for the automation project.', 'false'),
	(699, 175, 'Perform Remote Debugging refers to the process of testing and debugging an automation project on the same machine where UiPath Studio is installed.', 'false'),
	(700, 175, 'Perform Remote Debugging is only possible when the automation project does not involve Orchestrator queues and assets. ', 'false'),
	(701, 176, 'Info, Success, Warning, Error, Critical.', 'false'),
	(702, 176, 'Info, Success, Warn, Error, Fatal.', 'true'),
	(703, 176, 'Information, Complete, Warning, Error, Failure.', 'false'),
	(704, 176, 'Info, Completed, Warning, Error, Fatal.', 'false'),
	(705, 177, 'Input mode: Simulate works best with web applications. Input mode: Window Messages is the fastest and supports hotkeys.', 'false'),
	(706, 177, 'Input mode: Simulate is compatible with all applications. Input mode: Window Messages runs in the background and auto-empties the field.', 'false'),
	(707, 177, 'Input mode: Simulate runs in the background and auto-empties the field. Input mode: Window Messages supports hotkeys.', 'true'),
	(708, 177, 'Input mode: Simulate is the fastest and supports hotkeys. Input mode: Window Messages is compatible with all applications. ', 'false'),
	(709, 178, 'Using LINQ to filter a list of strings containing only "UiPath" by writing: listOfStrings.Where(Function(x) x = "UiPath").ToList()', 'true'),
	(710, 178, 'Applying LINQ to find duplicates in a list of integers by writing: listOfIntegers.FindDuplicates().ToList()', 'false'),
	(711, 178, 'Utilizing LINQ to sort DataTable rows based on a specific column by writing: dataTable.OrderBy(Function(x) x.ToString).CopyToDataTable()', 'false'),
	(712, 178, 'Executing LINQ to merge two Data Tables by writing: dataTable1.Merge(dataTable2).CopyToDataTable()', 'false'),
	(713, 179, 'Entry actions, Exit actions, Trigger conditions, and Transitions.', 'true'),
	(714, 179, 'Entry actions, Exit actions, Guard and Trigger attributes, and Transitions.', 'false'),
	(715, 179, 'Entry actions, Exit actions, Conditional expressions, and Transitions.', 'false'),
	(716, 179, 'Entry actions, Exit actions, Guard conditions, and Transitions.', 'false'),
	(717, 180, 'Get Group', 'false'),
	(718, 180, 'Download File', 'false'),
	(719, 180, 'Share File/Folder', 'false'),
	(720, 180, 'Get File/Folder ', 'true'),
	(721, 181, 'It replaces the need for OCR and image recognition activities in all automation projects involving web browsers.', 'false'),
	(722, 181, 'It provides a neural network server for analyzing the UI of applications when working with the Computer Vision activities package.', 'false'),
	(723, 181, 'It allows automation projects to be executed in virtual environments without installing any dedicated UiPath extension.', 'false'),
	(724, 181, 'It facilitates communication between remote applications and the dedicated UiPath extension, enabling native selector generation in UiExplorer. ', 'true'),
	(725, 182, 'InitAllApplications', 'false'),
	(726, 182, 'GetTransactionData', 'true'),
	(727, 182, 'Process', 'false'),
	(728, 182, 'SetTransactionStatus', 'false'),
	(729, 183, 'Today.SubtractUsingDate(-TimeSpan)', 'false'),
	(730, 183, 'Today.Subtract(TimeSpan)', 'true'),
	(731, 183, 'DateTime.Now - TimeSpan', 'false'),
	(732, 183, 'DateTime.SubtractSpanFrom(Today, TimeSpan)', 'false'),
	(733, 184, 'REST and SOAP APIs with JSON and XML payloads, OAuth 2.0 authentication only, building a connector from an API definition only.', 'false'),
	(734, 184, 'REST APIs with JSON payload, various authentication types including OAuth 2.0 and API Key, building a connector from an API definition or from scratch.', 'true'),
	(735, 184, 'REST APIs with JSON payload, OAuth 2.0 and Basic authentication types, building a connector from a Postman collection only.', 'false'),
	(736, 184, 'REST and SOAP APIs with JSON payload, various authentication types including OAuth 2.0 and Personal Access Token, building a connector from a Swagger definition only. ', 'false'),
	(737, 185, 'The process throws an exception in the "Get Transaction Data” state because the queue folder is not found, and then the process is stopped.', 'true'),
	(738, 185, 'The process throws an exception in the "Process Transaction" state because the queue folder is not found, and then the process is stopped.', 'false'),
	(739, 185, 'No exception is thrown and neither will a message be logged and the process continues.', 'false'),
	(740, 185, 'A warning message stating that the queue folder is missing is logged, and then the process continues. ', 'false'),
	(741, 186, 'Handling version control and collaboration among team members', 'false'),
	(742, 186, 'Facilitating the design and deployment of automation workflows.', 'false'),
	(743, 186, 'Real-time tracking of Robots, Machines, Queues, and Jobs.', 'true'),
	(744, 186, 'Consolidating event logs and records related to executed tasks and runtime anomalies. ', 'false'),
	(745, 187, 'The TestingActivitiesException sequence from the Catches block within the Try-Catch activity.', 'false'),
	(746, 187, 'None of the other blocks within the Try-Catch activity will be executed.', 'true'),
	(747, 187, 'The Exception sequence from the Catches block within the Try-Catch activity.', 'false'),
	(748, 187, 'The Finally block within the Try-Catch activity. ', 'false'),
	(749, 188, 'When the job is not able to start after 3 attempts for a single event or the job does not start for the last 25 events.', 'false'),
	(750, 188, 'When the job is not able to start after 5 attempts for a single event or the job does not start for the last 50 events.', 'false'),
	(751, 188, 'When the job is not able to start after 11 attempts for a single event or the job does not start for the last 100 events.', 'true'),
	(752, 188, 'When the job is not able to start after 20 attempts for a single event or the job does not start for the last 200 events. ', 'false'),
	(753, 189, 'Verify Control Attribute', 'true'),
	(754, 189, 'Verify Range', 'false'),
	(755, 189, 'Verify Expression', 'false'),
	(756, 189, 'Verify Expression With Operator', 'false'),
	(757, 190, 'Verification will be failed because the actual value is different than expected value.', 'false'),
	(758, 190, 'An exception will be thrown because there is no variable set in the Save to property of the Get text activity.', 'false'),
	(759, 190, 'Verification will not be executed.', 'false'),
	(760, 190, 'Verification will be passed.', 'true'),
	(761, 191, 'Applying LINQ to convert a list of integers to a JSON format by writing listOfIntegers.ToJSON().ToList()', 'false'),
	(762, 191, 'Utilizing LINQ to split a DataTable into multiple smaller DataTables based on a specific condition by writing dataTable.Split("ColumnName = ''Condition''").CopyToDataTable()', 'false'),
	(763, 191, 'Using LINQ to filter DataTable rows based on a specific condition by writing dataTable.AsEnumerable().Where(Function(row) row("ColumnName").ToString.Contains("Value")).Copy ToDataTable))', 'true'),
	(764, 191, 'Employing LINQ to concatenate two strings in a list by writing listOfStrings.Concatenate("String_1", "String_2").ToList()', 'false'),
	(765, 192, 'A namespace using the name of the Studio project.', 'true'),
	(766, 192, 'A new activity package with the name of the Studio project.', 'false'),
	(767, 192, 'A helper class using the name of the Studio project.', 'false'),
	(768, 192, 'A folder with the name of the Studio project. ', 'false'),
	(769, 193, 'The transaction is not completed.', 'false'),
	(770, 193, 'The job is still in progress.', 'false'),
	(771, 193, 'Recording is not enabled at the process level.', 'true'),
	(772, 193, 'The transaction has too many logs stored in the Logs page.', 'false'),
	(773, 194, 'In the Try section of the Try Catch activity in the End Process state.', 'false'),
	(774, 194, 'In the Finally section of the Try Catch activity in the End Process state.', 'false'),
	(775, 194, 'In the Finally section of the Try Catch activity in the Process Transaction state.', 'true'),
	(776, 194, 'In the Try and Catches sections of the Try Catch activity in the Process Transaction state. ', 'false'),
	(777, 195, 'It provides a performance analysis of all the operations, showing you a complete list of exceptions and errors during the execution or debugging of a workflow.', 'false'),
	(778, 195, 'It provides a performance analysis of all the operations, showing you a cumulative percentage of the execution time of each activity when you run or debug a workflow.', 'true'),
	(779, 195, 'It provides a performance analysis of all the operations, displaying a breakdown of each variable used during the execution of a workflow.', 'false'),
	(780, 195, 'It provides a performance analysis of all the operations, showing you a cumulative percentage of the execution time of each activity even when the workflow is idle. ', 'false'),
	(781, 196, 'DateTime.ParseExact(DateString, “mm/dd/yyyy HH:mm:ss tz”, CultureInfo.InvariantCultue}', 'false'),
	(782, 196, 'DateTime.ParseExact(DateString, “dd/MM/yyyy HH:mm:ss tz”, CultureInfo.InvariantCulture}', 'false'),
	(783, 196, 'DateTime.ParseExact(DateString, “dd/MM/yyyy hh:mm:ss tt”, CultureInfo.InvariantCulture}', 'true'),
	(784, 196, 'DateTime.ParseExact(DateString, “mm/dd/yyyy hh:mm:ss tt”, CultureInfo.InvariantCultue}', 'false'),
	(785, 197, 'Application event triggers, such as Minimized or Restored, to ensure the tour adapts to application state changes.', 'false'),
	(786, 197, 'Predefined event triggers for only one specific action, such as Click, limiting responsiveness to user behavior.', 'false'),
	(787, 197, 'System event triggers, such as process start or shutdown, to ensure the tour begins when the application starts.', 'false'),
	(788, 197, 'User event triggers, such as Click, Keypress, or Hotkey, to respond directly to user interactions.', 'true'),
	(789, 198, 'Yes, event types can be enabled or disabled even after you’ve started the event recording', 'false'),
	(790, 198, 'No, event types can only be disabled or enabled before starting the event recording', 'true'),
	(791, 198, 'No, you cannot modify the event list during the recording', 'false'),
	(792, 198, 'Yes, but you have to pause the event recording first', 'false'),
	(793, 199, 'In the End Process state in the Finally section of the Try Catch activity.', 'false'),
	(794, 199, 'Only in the RetryCurrentTransaction.xaml workflow.', 'false'),
	(795, 199, 'In the RetryCurrentTransaction.xaml workflow and in the SetTransactionStatus.xaml workflow.', 'true'),
	(796, 199, 'In the New Transaction transition.', 'false'),
	(797, 200, 'Apps, queues, and unattended robots only', 'false'),
	(798, 200, 'ML skills, workflows, and attended robots', 'false'),
	(799, 200, 'Only Studio workflows and assets', 'false'),
	(800, 200, 'Processes, assets, queues, storage buckets, and ML skills', 'true'),
	(801, 201, 'Only in Cross-platform projects.', 'false'),
	(802, 201, 'Only in Windows projects.', 'false'),
	(803, 201, 'Only in Web projects.', 'false'),
	(804, 201, 'Windows and Cross-platform projects.', 'true'),
	(805, 202, 'Keypress event by a user', 'true'),
	(806, 202, 'Event of data analysis in a machine learning model', 'false'),
	(807, 202, 'File transfer event between servers', 'false'),
	(808, 202, 'Data processing event by a server', 'false'),
	(809, 203, 'Studio local NuGet cache.', 'false'),
	(810, 203, 'Orchestrator feeds and Robot activity feeds.', 'false'),
	(811, 203, 'Orchestrator feeds and UiPath Official activity feed.', 'true'),
	(812, 203, 'Activity feeds configured in Studio.', 'false'),
	(813, 204, 'Any available Attended robot.', 'false'),
	(814, 204, 'Any available Unattended robot.', 'false'),
	(815, 204, 'Any Unattended robot in "Resume" state.', 'false'),
	(816, 204, 'The same robot that executed the job until suspension.', 'true'),
	(817, 205, 'You could use UiPath Data Service to create an unattended workflow that gathers all required data from different systems at once.', 'true'),
	(818, 205, 'You could use UiPath Data Service to backup and store all different types of reports in an attempt to safeguard the data in case of shifts before the completion of the process.', 'false'),
	(819, 205, 'Using UiPath Data Service, you could try to enforce a rule that requires all users to record all changes they make to data.', 'false'),
	(820, 205, 'You could use UiPath Data Service as a checkpoint to only collect pertinent invoice details hoping for other data to stay intact throughout the duration. ', 'false'),
	(821, 206, 'GET, POST, PUT, PATCH, and DELETE.', 'true'),
	(822, 206, 'GET, POST, HEAD, OPTIONS, and DELETE.', 'false'),
	(823, 206, 'GET, POST, PUT, CONNECT, and TRACE.', 'false'),
	(824, 206, 'GET, POST, PUT, COPY, and UNLOCK. ', 'false'),
	(825, 207, 'From the Project tab in Studio.', 'false'),
	(826, 207, 'From the Tools tab in Studio.', 'false'),
	(827, 207, 'From the Design tab in Studio.', 'false'),
	(828, 207, 'From the Debug tab in Studio. ', 'true'),
	(829, 208, 'Physical Servers Robots', 'false'),
	(830, 208, 'Serverless Automation Cloud Robots', 'true'),
	(831, 208, 'Hybrid Cloud Robots', 'false'),
	(832, 208, 'Cloud Robots – VM', 'false'),
	(833, 209, 'A warning message stating that the queue folder is missing is logged, and then the process continues.', 'false'),
	(834, 209, 'The process throws an exception in the “Get Transaction Data” state because the queue folder is not found, and then the process is stopped.', 'true'),
	(835, 209, 'A warning message stating that the queue folder is missing is logged, and then the process is stopped.', 'false'),
	(836, 209, 'The process throws an exception in the “Initialization” state because the queue folder is not found, and then the process is stopped. ', 'false');
/*!40000 ALTER TABLE "opcoes" ENABLE KEYS */;

-- Copiando estrutura para tabela app_simulado.pontuacoes_por_tipo
CREATE TABLE IF NOT EXISTS "pontuacoes_por_tipo" (
	"id" INTEGER NOT NULL,
	"simulado_id" INTEGER NOT NULL,
	"tipo" VARCHAR(255) NOT NULL,
	"corretas" INTEGER NOT NULL,
	"total" INTEGER NOT NULL,
	"porcentagem" NUMERIC(5,2) NOT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "pontuacoes_por_tipo_ibfk_1" FOREIGN KEY ("simulado_id") REFERENCES "simulados" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Copiando dados para a tabela app_simulado.pontuacoes_por_tipo: -1 rows
/*!40000 ALTER TABLE "pontuacoes_por_tipo" DISABLE KEYS */;
INSERT INTO "pontuacoes_por_tipo" ("id", "simulado_id", "tipo", "corretas", "total", "porcentagem") VALUES
	(5, 5, 'Orchestrator', 7, 10, 70.00),
	(6, 5, 'Debugging', 4, 10, 40.00),
	(7, 5, 'Advanced Control Flow', 3, 8, 37.50),
	(8, 5, 'Advanced Data Manipulation', 3, 10, 30.00),
	(9, 5, 'Advanced UI Automation', 8, 10, 80.00),
	(10, 5, 'Other advanced concepts', 5, 10, 50.00),
	(11, 5, 'REFramework', 5, 10, 50.00),
	(12, 5, 'Attended Automation', 0, 1, 0.00);
/*!40000 ALTER TABLE "pontuacoes_por_tipo" ENABLE KEYS */;

-- Copiando estrutura para tabela app_simulado.questoes
CREATE TABLE IF NOT EXISTS "questoes" (
	"id" INTEGER NOT NULL,
	"autor_id" INTEGER NOT NULL,
	"enunciado" TEXT NOT NULL,
	"data_criacao" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"tipo" VARCHAR(50) NOT NULL,
	"imagem_url" VARCHAR(250) NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "questoes_ibfk_1" FOREIGN KEY ("autor_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Copiando dados para a tabela app_simulado.questoes: 99 rows
/*!40000 ALTER TABLE "questoes" DISABLE KEYS */;
INSERT INTO "questoes" ("id", "autor_id", "enunciado", "data_criacao", "tipo", "imagem_url") VALUES
	(5, 1, 'Where is the TransactionNumber incremented in the REFramework?', '2025-08-26 21:20:34.231105', 'REFramework', NULL),
	(1, 1, 'What are the primary functions of the UiPath Integration Service?', '2025-08-26 21:11:58.775017', 'Orchestrator', NULL),
	(2, 1, 'What happens when closing a Remote Debugging Connection while a debugging execution is in progress?', '2025-08-26 21:12:38.448626', 'Debugging', NULL),
	(6, 1, 'Which logging level includes the following information by default?
1. Execution Started log entry - generated every time a process is started.
2. Execution Ended log entry - generated every time a process is finalized.
3. Transaction Started log entry - generated every time a transaction item is obtained by the robot from Orchestrator.
4. Transaction Ended log entry - generated every time the robot sets the transaction status to either Success or Failed.
5. Activity Information log entry - generated every time an activity is started, faulted or finished inside a workflow.
6. Arguments and Variables Information log entry - show values of the variables and arguments that are used.', '2025-08-26 21:22:42.0885', 'Debugging', NULL),
	(7, 1, 'How would you define a linear process in UiPath?', '2025-08-26 21:40:37.772196', 'Advanced Control Flow', NULL),
	(8, 1, 'A developer is building a process that needs to click an element which requires a mouse hover to become visible. However, the element does not
appear with the default click setting. The input method for the Click activity is Send Window Message.
Which property should the developer configure to be able to click the element?', '2025-08-26 21:41:10.579744', 'Advanced UI Automation', NULL),
	(9, 1, 'A developer wants to create an automation in which the input from the user and pre-defined conditions determine the transition between stages.
In UiPath Studio, which is the recommended type of workflow that meets the requirement?', '2025-08-26 21:41:31.128401', 'Advanced Control Flow', NULL),
	(12, 1, 'What is the default priority value for the Job Priority field in UiPath Orchestrator when starting a job manually?', '2025-08-26 21:45:25.908344', 'Orchestrator', NULL),
	(13, 1, 'A developer configured the properties for a Click activity as shown below:

What happens if the activity cannot find its target at runtime?', '2025-08-26 21:50:39.425384', 'Advanced UI Automation', 'https://i.ibb.co/7Jvf0TGz/imagem-2025-08-26-214925017.png'),
	(14, 1, 'Consider testing a workflow that computes the sum of two numbers having the data driven test data from the Excel file below: (Image 1)

Expanding the functionality of the workflow to compute the sum of three numbers, the data needs to be updated as well to accommodate the new
scenario: (Image 2)

What are steps to do that?', '2025-08-26 21:51:54.395068', 'Debugging', 'https://i.ibb.co/rKFWQfHH/imagem-2025-08-26-215114267.png||https://i.ibb.co/GQfBNfWb/imagem-2025-08-26-215150666.png'),
	(16, 1, 'A developer is building an automation that must interact with a destination remote computer reached by jumping through multiple RDP
connections, as described by the following scenario:
- The Robot is installed on Machine A, which connects through RDP to Machine B.
- From Machine B another RDP connection is opened to Machine C, where the automation must be performed.
Which of the following scenarios is appropriate for the developer who wants to use UI Automation activities?', '2025-08-26 21:52:55.375169', 'Advanced UI Automation', NULL),
	(18, 1, 'How does UiPath handle different dependency versions for multiple running processes that run at the same time?', '2025-08-26 21:59:53.721132', 'Other advanced concepts', NULL),
	(19, 1, 'In order for a developer to utilize the default REFramework without relying on Orchestrator queues, what is the essential prerequisite to ensure
that the project does not interact with Orchestrator?', '2025-08-26 22:00:09.219773', 'REFramework', NULL),
	(20, 1, 'Which of the following describes the correct hierarchy of the elements in the Object Repository tree structure?', '2025-08-26 22:00:22.242464', 'Advanced UI Automation', NULL),
	(21, 1, 'A developer wants to add items to a list of strings using the Invoke Method activity. The list is declared as follows: (Image 1)

The Invoke Method activity has the following properties: (Image 2)

The Parameters property is as follows: (Image 3)

Based on the information shown in the exhibits what is the outcome of the Invoke Method activity?', '2025-08-26 22:01:48.186834', 'Advanced Data Manipulation', 'https://i.ibb.co/sdzjmhQ4/imagem-2025-08-26-220116078.png||https://i.ibb.co/wNLX4Btd/imagem-2025-08-26-220127142.png||https://i.ibb.co/ksYT6BfT/imagem-2025-08-26-220135151.png'),
	(22, 1, 'What is the default polling interval set for an event trigger?', '2025-08-26 22:02:57.66898', 'Orchestrator', NULL),
	(23, 1, 'When should the Show Elements button be used in the Computer Vision wizard?', '2025-08-26 22:03:52.191358', 'Advanced UI Automation', NULL),
	(24, 1, 'In a UiPath State Machine workflow, which section of State activity is used to specify conditional/triggers logic and multiple outgoing transitions
in a state machine?', '2025-08-26 22:04:06.940523', 'Advanced Control Flow', NULL),
	(25, 1, 'In a UiPath REFramework project, what is the primary purpose of using Custom Log Fields?', '2025-08-26 22:04:26.306509', 'REFramework', NULL),
	(26, 1, 'What method can be used to change the index of an existing column in a datatable?', '2025-08-26 22:04:42.269982', 'Advanced Data Manipulation', NULL),
	(27, 1, 'A developer is building a process that types data into input fields using the Hardware Events input method. Which property of the Type Into
activity should be modified to reduce the pace at which the input string characters are typed into the fields?', '2025-08-26 22:04:53.740606', 'Advanced UI Automation', NULL),
	(28, 1, 'While working in an RPA testing project, you encountered the following activity in one of the workflows included in the project. (Image 1)
What action can you perform in your mocked file to replace the functionality of the MessageBox with a LogMessage during mock testing?', '2025-08-26 22:05:39.517408', 'Debugging', 'https://i.ibb.co/mFgmPy5d/imagem-2025-08-26-220525410.png'),
	(29, 1, 'A developer is building an automation which types text into a text file. The Activity Project Settings tor UI Automation Modern activities are set
as follows: (Image 1)

The developer has configured the properties of a Type Into activity as follows: (Image 2)
What is the behavior of the Type Into activity when executing the workflow?', '2025-08-26 22:06:43.759706', 'Advanced UI Automation', 'https://i.ibb.co/hRMsxSj6/imagem-2025-08-26-220624132.png||https://i.ibb.co/RGbFV8Xh/imagem-2025-08-26-220630073.png'),
	(30, 1, 'What do the percentages from the Test Explorer panel represent? (Image 1)', '2025-08-26 22:07:15.706075', 'Debugging', 'https://i.ibb.co/1tx2ky6C/imagem-2025-08-26-220706098.png'),
	(31, 1, 'To retrieve all Outlook emails with the word "UiPath" in the subject, which filtering property and filter schema should a developer use?', '2025-08-26 22:07:27.462611', 'Advanced Data Manipulation', NULL),
	(65, 1, 'In the Robotic Enterprise (RE) Framework, at which point should a developer log a clear message with the Logging Level set to "Information,"
adhering to the best practices for automating a production-level process?', '2025-08-26 22:40:28.258834', 'REFramework', NULL),
	(201, 1, 'In which type of UiPath projects can you use coded automation?', '2025-08-27 03:02:38.059932', 'REFramework', NULL),
	(32, 1, 'Given the following list of arguments: (Image 1)

and the following code: (Image 2)

What is the value that will be displayed in the Output Panel at the end of the sequence below: (Image 3)', '2025-08-26 22:08:47.783086', 'Advanced Data Manipulation', 'https://i.ibb.co/BVFPgJBT/imagem-2025-08-26-220816330.png||https://i.ibb.co/vxysvxd8/imagem-2025-08-26-220822419.png||https://i.ibb.co/twNPNM18/imagem-2025-08-26-220832264.png'),
	(33, 1, 'What is the use of job priorities in unattended automations within UiPath Orchestrator?', '2025-08-26 22:09:00.711771', 'Orchestrator', NULL),
	(34, 1, 'Which command in the UiPath installation folder configures the UIPath.RemoteDebugging.Agent utility on a Windows robot to accept remote
debugging requests from Studio?', '2025-08-26 22:09:20.9415', 'Debugging', NULL),
	(35, 1, 'When installing UiPath Studio, which of the following actions require administrator privileges?', '2025-08-26 22:09:35.867505', 'Other advanced concepts', NULL),
	(36, 1, 'Where in the REFramework template project is the "SetTransactionStatus.xaml" invoked?', '2025-08-26 22:09:50.138419', 'REFramework', NULL),
	(37, 1, 'What is a pre-requisite for running functional test cases in REFramework?', '2025-08-26 22:10:24.872223', 'REFramework', NULL),
	(38, 1, 'The following table is stored in a variable called "dt" (Image 1)

What will the value of the qty variable be after executing the Assign activity? (Image 2)', '2025-08-26 22:11:15.215675', 'Advanced Data Manipulation', 'https://i.ibb.co/GQH2zHMc/imagem-2025-08-26-221101379.png'),
	(39, 1, 'What is the purpose of the Interval filter in the Orchestrator''s Monitoring page?', '2025-08-26 22:11:28.964735', 'Orchestrator', NULL),
	(40, 1, 'A developer implemented a process using the Robotic Enterprise Framework and an Orchestrator queue. The MaxRetryNumber from the
"Config.xlsx" file is set to "1" and the Max # of retries from the Queue settings from Orchestrator is set to "2". At runtime, the first transaction
item throws a Business Exception.
How many times will the transaction be retried?', '2025-08-26 22:11:40.530281', 'REFramework', NULL),
	(41, 1, 'What role do Triggers play in the UiPath Integration Service?', '2025-08-26 22:11:51.924177', 'Orchestrator', NULL),
	(42, 1, 'Which of the following options is correct about a State Machine layout?', '2025-08-26 22:12:02.848625', 'Advanced Control Flow', NULL),
	(43, 1, 'A developer needs to create a repetitive process in the REFramework. Following the best practices, which action(s) should be performed to
defend against potential robot crashes such as "out of memory"?', '2025-08-26 22:12:19.963105', 'REFramework', NULL),
	(44, 1, 'Which of the following demonstrates the correct syntax for using the Vb.Net "If" Operator?', '2025-08-26 22:12:33.653435', 'Advanced Data Manipulation', NULL),
	(45, 1, 'A developer creates a process that uses data from multiple sources and uploads it to an Orchestrator queue. The data originates from emails in
different email inboxes and needs to be processed in the same order in which the email was received. To ensure the Queue Items are processed in
the correct order, which property of the Add Queue Item activity should be used?', '2025-08-26 22:12:47.553198', 'Orchestrator', NULL),
	(46, 1, 'A developer is working on an automation using the REFramework. Each transaction item represents a piece of client information. For each
customer, the automated procedure must click the "Generate Shipment Details" button. This generates a table of shipment records for each
customer.
What type of exception occurs when the data is not accessible, the created table displays only the header row, and processing for that client must
be halted?', '2025-08-26 22:12:59.625398', 'REFramework', NULL),
	(47, 1, 'What are the three main components of UiPath Integration Service?', '2025-08-26 22:13:11.344104', 'Orchestrator', NULL),
	(48, 1, 'DRAG DROP -
What are the steps to publish a project from UiPath Studio?
Instructions: Drag the Description found on the "Left" and drop on the correct Step Sequence found on the "Right". (Image 1)', '2025-08-26 22:25:13.934107', 'REFramework', 'https://i.ibb.co/m55wnJxb/imagem-2025-08-26-222437568.png'),
	(49, 1, 'A developer examines a workflow in which filenames are stored within a collection. The collection is initialized with a single filename. When
adding a new filename to the collection, which collection variable type will cause an error?', '2025-08-26 22:25:31.712851', 'Advanced Data Manipulation', NULL),
	(50, 1, 'What is the default URL of the OCR server that runs the Computer Vision service?', '2025-08-26 22:25:58.291507', 'Advanced UI Automation', NULL),
	(51, 1, 'In the context of a linear process, implemented with REFramework, how many times will the process enter the Get Transaction Data state?', '2025-08-26 22:26:19.2493', 'REFramework', NULL),
	(52, 1, 'A project built using REFramework pulls phone numbers from a database of employees and creates queue items for each one. Following
processing, these elements must be added to a financing application. The queue item holding a phone number becomes invalid if a digit is
accidentally left out because of a human mistake. As a requirement, queue items that contain partial numbers should not be accepted.
What type of error should be thrown according to best practices?', '2025-08-26 22:26:55.932473', 'REFramework', NULL),
	(53, 1, 'What is the correct method to check how many resources are utilized in a personal workspace in UiPath Orchestrator?', '2025-08-26 22:27:09.581852', 'Orchestrator', NULL),
	(54, 1, 'Starting with UiPath Studio version 2022.10, what happens to dependencies that lack Windows compatibility when they are converted in a
project?', '2025-08-26 22:28:53.399606', 'Other advanced concepts', NULL),
	(55, 1, 'DRAG DROP -
How should the computation of the signature be done for client apps that receive Orchestrator requests and need to check their authenticity?
Instructions: Drag the Description found on the left and drop on the correct Step Sequence found on the right.

(Image 1)', '2025-08-26 22:31:29.60909', 'Orchestrator', NULL),
	(56, 1, 'What is the recommended approach for handling tabular data when building a REFramework transactional project in UiPath?', '2025-08-26 22:34:07.806842', 'REFramework', NULL),
	(57, 1, 'What is the purpose of credential stores in UiPath Orchestrator?', '2025-08-26 22:35:12.840985', 'Orchestrator', NULL),
	(58, 1, 'Which of the following statements is true about the existing UiPath Studio installation packages?', '2025-08-26 22:37:14.861571', 'Other advanced concepts', NULL),
	(59, 1, 'When a developer runs a process using the REFramework, with the process utilizing Orchestrator queues and a queue already created with the
Name provided and the Auto Retry function disabled, which states will be executed without errors?', '2025-08-26 22:37:27.181303', 'REFramework', NULL),
	(60, 1, 'What is the output type returned when using a Get Test Data Queue Item activity?', '2025-08-26 22:38:04.291442', 'REFramework', NULL),
	(61, 1, 'Following UiPath best practices, which project structure is best-suited for complex processes in UiPath Studio?', '2025-08-26 22:38:20.809276', 'Advanced Control Flow', NULL),
	(62, 1, 'Considering that the attached table is stored in a variable called "dt": (Image 1)

Which LINQ query can be used to return the maximum total Quantity?', '2025-08-26 22:39:32.58492', 'Advanced Data Manipulation', 'https://i.ibb.co/SwBhyVHx/imagem-2025-08-26-223859347.png'),
	(63, 1, 'What is the purpose of the Invoke Code activity in UiPath?', '2025-08-26 22:39:50.219458', 'Other advanced concepts', NULL),
	(64, 1, 'Which of the following is an outcome of converting a personal workspace into a folder in UiPath Orchestrator?', '2025-08-26 22:40:15.512791', 'Orchestrator', NULL),
	(165, 1, 'Which type of exception is captured by default when an unexpected problem occurs at the application level in the REFramework''s
“Process.xaml” file?', '2025-08-27 02:46:50.752113', 'REFramework', NULL),
	(66, 1, 'A developer has defined a variable named “CurrentDate” of type DateTime. Which of the following expressions can be used to show what hour
was 12 hours prior to the date from the variable?', '2025-08-26 22:40:44.026047', 'Advanced Data Manipulation', NULL),
	(67, 1, 'A developer needs to use the REFramework to automate a business process that involves processing transactions within an Excel table. Each
transaction in the table should follow the same steps for processing and queues cannot be used as there is no Orchestrator in the environment.
Which variable type is best suited for TransactionItem in this scenario?', '2025-08-26 22:40:58.22503', 'REFramework', NULL),
	(68, 1, 'Which Scraping method should be used for the Get Text activity to capture hidden text from an application?', '2025-08-26 22:41:12.144522', 'Advanced UI Automation', NULL),
	(69, 1, 'Which of the following best describes the Alerts panel?', '2025-08-26 22:41:26.568276', 'Orchestrator', NULL),
	(70, 1, 'Once “Library A” has been imported as a dependency in the current project, how can the UI Object Repository defined in “Library A” be
accessed?', '2025-08-26 22:41:43.521131', 'Other advanced concepts', NULL),
	(71, 1, 'What happens when the area selection feature in the UiPath Computer Vision wizard is used?', '2025-08-26 22:41:58.801062', 'Advanced UI Automation', NULL),
	(72, 1, 'How does UiPath Integration Service benefit automation developers?', '2025-08-26 22:42:45.855079', 'Other advanced concepts', NULL),
	(73, 1, 'What are the components that define a state within a State Machine in UiPath Studio?', '2025-08-26 22:43:05.725685', 'Advanced Control Flow', NULL),
	(74, 1, 'A developer has created a string array variable as shown below:
UserNames = {“Jane”, “Jack”, “Jill”, “John”}
Which expression should the developer use in a Log Message activity to print the elements of the array separated by the string “,”?', '2025-08-26 22:43:22.490054', 'Advanced Data Manipulation', NULL),
	(75, 1, 'Which activity can be used to transition a Background Process to Foreground?', '2025-08-26 22:43:49.621158', 'Attended Automation', NULL),
	(76, 1, 'When configuring the Max # of retries for the queue in Orchestrator to “1” for your process, and the queue has 5 transaction items. At runtime,
the first transaction item throws a Business Rule Exception.
How does the process proceed?', '2025-08-26 22:44:03.466657', 'Orchestrator', NULL),
	(77, 1, 'At indication time, the Strict Selector has the following functionalities available:', '2025-08-26 22:44:13.646278', 'Advanced UI Automation', NULL),
	(78, 1, 'When automating the process of entering values into a web form, requiring each field to be brought to the foreground, which property on the
Type into activity should be adjusted to achieve this?', '2025-08-26 22:44:32.154296', 'Advanced UI Automation', NULL),
	(79, 1, 'What is the role of connections in the UiPath Integration Service?', '2025-08-26 22:44:48.156053', 'Orchestrator', NULL),
	(80, 1, 'What status needs to be selected in the Set Transaction Status activity in UiPath Studio so that the respective Queue Item will be retried?', '2025-08-26 22:45:00.147773', 'REFramework', NULL),
	(81, 1, 'A developer intends to enter text into an input field using a combination of a string and a hotkey. The input action should take place within a
hidden or minimized window.
Which input method(s) can be used individually for the Type Into activity?', '2025-08-26 22:45:12.273446', 'Advanced UI Automation', NULL),
	(82, 1, 'Which activity should a developer use to add custom information to logs related to transactions for tracing purposes?', '2025-08-26 22:45:26.723264', 'Debugging', NULL),
	(83, 1, 'What advantages do pre-built connectors in UiPath Integration Service offer?', '2025-08-26 22:47:16.476416', 'Other advanced concepts', NULL),
	(84, 1, 'Which expression correctly converts the string variable “DateString” with the value “03/03/2023 16:23:11” into a Date Time variable?', '2025-08-26 22:47:28.596051', 'Advanced Data Manipulation', NULL),
	(85, 1, 'What distinguishes the Settings sheet from the Assets sheet in the “Config.xisx’ file?', '2025-08-26 22:47:43.747371', 'REFramework', NULL),
	(86, 1, 'A developer defines new log fields using the Add Log Fields activity. When will the custom log fields stop being added to the robot execution
logs?', '2025-08-26 22:48:01.067389', 'Debugging', NULL),
	(87, 1, 'In a UiPath project that uses State Machines, under what circumstances should the Final State activity be used in the project?', '2025-08-26 22:48:14.827776', 'Advanced Control Flow', NULL),
	(88, 1, 'The Extract PDF Page Range activity is used to extract a specific set of pages from a PDF file. Which of the following statements correctly
describes this activity?', '2025-08-26 22:48:28.034962', 'Other advanced concepts', NULL),
	(89, 1, 'What actions must be manually selected in the App/Web Recorder before recording a step?', '2025-08-26 22:48:45.320001', 'Advanced UI Automation', NULL),
	(90, 1, 'Which of the following credentials stores have built in support in Orchestrator?', '2025-08-26 22:48:56.569793', 'Orchestrator', NULL),
	(91, 1, 'Which of the following statements accurately describes the primary components of a State Machine in a workflow?', '2025-08-26 22:49:38.970555', 'Advanced Control Flow', NULL),
	(92, 1, 'What is a pre-requisite for running InitAllApplications TestCase?', '2025-08-26 22:49:51.686164', 'REFramework', NULL),
	(93, 1, 'What is the functionality of the Include Subfolders filter in the Monitoring pages when a modern folder is selected?', '2025-08-26 22:50:13.237352', 'Orchestrator', NULL),
	(94, 1, 'Which LINQ method is used to filter data in a List or DataTable based on a condition?', '2025-08-26 22:50:24.947639', 'Advanced Data Manipulation', NULL),
	(95, 1, 'What is the main function of the UiPath Remote Runtime component?', '2025-08-26 22:50:39.868837', 'Advanced UI Automation', NULL),
	(96, 1, 'What is a prerequisite for performing Remote Debugging using a Remote Machine Connection?', '2025-08-26 22:50:52.834367', 'Debugging', NULL),
	(97, 1, 'A developer has created a variable of type List of Strings named “UserList” and initialized it with an empty list: “UserList = new List(Of String)”.
What is printed in the log message after the following Invoke Code is executed? (Image 1)', '2025-08-26 22:51:30.757124', 'Advanced Data Manipulation', 'https://i.ibb.co/m53FnBx5/imagem-2025-08-26-225119883.png'),
	(98, 1, 'When creating a new test case, which option restricts dynamic data update in UiPath Orchestrator once the test case is published? (Image 1)', '2025-08-26 22:52:33.802598', 'Other advanced concepts', 'https://i.ibb.co/xK0zKw2N/imagem-2025-08-26-225151048.png'),
	(99, 1, 'What is the purpose of the Capture All Elements feature in Object Repository?', '2025-08-26 22:52:46.628013', 'Advanced UI Automation', NULL),
	(100, 1, 'Considering a process developed using REFramework, if the status of a transaction was set to “Failed” with the ErrorType specified as
“Business”, the process will transition to which state?', '2025-08-26 22:53:09.833385', 'REFramework', NULL),
	(101, 1, 'In an RPA Testing project, you created the mock “MySequencemock” for the file “MySequence”. You have the update “MySequence” and add a
Log Message activity and a Verify Expression activity.
What will happen to “MySequencemock” file when you save the project, assuming that the file is closed?', '2025-08-26 22:53:23.833888', 'Debugging', NULL),
	(102, 1, 'Which of the following options is correct regarding the below Object Repository tree structure? (Image 1)', '2025-08-26 22:53:55.757083', 'Advanced UI Automation', 'https://i.ibb.co/xtVSG3w0/imagem-2025-08-26-225350521.png'),
	(199, 1, 'Where is the TransactionNumber incremented in the REFramework?', '2025-08-27 03:02:14.093365', 'REFramework', NULL),
	(202, 1, 'What event could potentially be monitored by triggers in an attended automation scenario?', '2025-08-27 03:02:48.780612', 'Attended Automation', NULL),
	(103, 1, 'A developer wants to add items to a list of strings using the Invoke Method activity. The list is declared as follows: (Image 1)

The Invoke Method activity has the following properties: (Image 2)

The Parameters property is as follows: (Image 3)

Based on the information shown in the exhibits what is the outcome of the Invoke Method activity?', '2025-08-26 22:55:26.109732', 'Advanced Data Manipulation', 'https://i.ibb.co/kVFdd1kz/imagem-2025-08-26-225449737.png||https://i.ibb.co/rfTjvWyP/imagem-2025-08-26-225457314.png||https://i.ibb.co/FLBSfGWg/imagem-2025-08-26-225503577.png'),
	(104, 1, 'When encountering an ApplicationException, what occurs if the developer chooses InvalidOperationException as the exception handler within
the Catches section of the Try Catch activity? (Image 1)', '2025-08-26 22:55:53.822184', 'Debugging', 'https://i.ibb.co/pk4sTw6/imagem-2025-08-26-225544622.png'),
	(105, 1, 'In the context of the REFramework, if the OrchestratorQueueName key is present in both the Settings and Assets sheets, but an asset with the
corresponding name is not present in Orchestrator, what will be the behavior at run time?', '2025-08-26 22:56:10.203882', 'REFramework', NULL),
	(106, 1, 'Data from an Excel file is read into a data table named "dtEmployee", as displayed in the following graphic: (Image 1)

A developer needs to filter the data table to obtain all rows representing employees from the Finance and IT departments with a Salary under
30,000. Which expression yields the desired outcomes?', '2025-08-27 01:55:35.999384', 'Advanced Data Manipulation', 'https://i.ibb.co/5hyWLpPj/Screenshot-5.png'),
	(107, 1, 'Review the following graphics: (Images)

An animation on the web page never completely loads but the element indicated in the Click activity does load within the specified timeout
duration. What occurs when this Click activity executes?', '2025-08-27 02:21:24.558518', 'Advanced UI Automation', 'https://i.ibb.co/KzhBbWvq/imagem-2025-08-27-022012023.png||https://i.ibb.co/wNHVZjvP/imagem-2025-08-27-022027502.png||https://i.ibb.co/Fb733QZ1/imagem-2025-08-27-022039037.png||https://i.ibb.co/fzhYkXVj/imagem-2025-08-27-022048784.png'),
	(108, 1, 'Review the following graphics: (Images)

If the automation is executed and Notepad.exe is not running, which Log Message text value is contained in the Output panel?', '2025-08-27 02:22:58.806503', 'Debugging', 'https://i.ibb.co/ycQ7QF4v/imagem-2025-08-27-022207989.png||https://i.ibb.co/Cp51yTZV/imagem-2025-08-27-022220177.png||https://i.ibb.co/6RMCd9kT/imagem-2025-08-27-022229841.png||https://i.ibb.co/4gS0ynpx/imagem-2025-08-27-022238543.png'),
	(109, 1, 'HOTSPOT
-
A developer aims to employ the REFramework for automating a business process that involves a TransactionData collection (DataTable)
comprising vendor names and addresses.
Instructions: Choose the appropriate variable type for the TransactionItem from the provided drop-down list in the following exhibit. (Image)', '2025-08-27 02:24:26.325362', 'REFramework', 'https://i.ibb.co/nMZf49Wd/imagem-2025-08-27-022406436.png'),
	(110, 1, 'Considering that the attached data table is stored in a variable called “dt”:

(Image)

Which of the following expressions will throw an exception during execution?', '2025-08-27 02:26:36.088421', 'Advanced Data Manipulation', 'https://i.ibb.co/S4TZ5gkn/imagem-2025-08-27-022624360.png'),
	(111, 1, 'Which of the following statements correctly illustrates using LINQ to process data in a UiPath project?', '2025-08-27 02:26:50.190015', 'Advanced Data Manipulation', NULL),
	(112, 1, 'In UIPath Orchestrator, when managing multiple Jobs in a queue, which feature allows operators to dictate the execution sequence by assigning
the importance of each Job?', '2025-08-27 02:27:07.02112', 'Orchestrator', NULL),
	(113, 1, 'When developing a new project using REFramework, logging in to multiple applications is required. What is the recommended location to
accomplish this task?', '2025-08-27 02:27:42.221252', 'REFramework', NULL),
	(114, 1, 'How can a process be converted from a foreground process to a background process?', '2025-08-27 02:28:02.887295', 'Attended Automation', NULL),
	(115, 1, 'How can UiPath Orchestrator help address potential issues before they become critical problems?', '2025-08-27 02:28:19.415822', 'Orchestrator', NULL),
	(116, 1, 'What are the two types of elements that can be included in an Object Repository?', '2025-08-27 02:28:42.103223', 'Advanced UI Automation', NULL),
	(117, 1, 'Which one of the following expressions is the equivalent of the if activity from the picture?

(Image)', '2025-08-27 02:29:19.074441', 'Advanced Control Flow', 'https://i.ibb.co/TDVPGwcn/imagem-2025-08-27-022908407.png'),
	(118, 1, 'What is the role of server-side event triggers in UiPath Integration Service?', '2025-08-27 02:29:41.730137', 'Other advanced concepts', NULL),
	(119, 1, 'What does Application Exception describe?', '2025-08-27 02:29:59.095656', 'Debugging', NULL),
	(120, 1, 'A developer designed a process in the REFramework using Orchestrator queues. In which state(s) will be the status updated for each Transaction
Item in the queue?', '2025-08-27 02:30:15.247721', 'REFramework', NULL),
	(121, 1, 'How are mock files organized in an automation project structure?', '2025-08-27 02:30:29.463465', 'Debugging', NULL),
	(122, 1, 'When should a developer log a coherent message with the Logging Level set as “Info” while building an automation project?', '2025-08-27 02:30:43.963306', 'Debugging', NULL),
	(123, 1, 'The “arrayOfPointsGainedByParticipant” Object array is created and initialized with the following values: {“7”, “4”, “1”}. Which is the value and
data type returned, at runtime, by arrayOfPointsGainedByParticipant(1)?', '2025-08-27 02:31:00.533727', 'Advanced Data Manipulation', NULL),
	(124, 1, 'In UiPath Studio, when a developer executes a workflow in Debug mode and the process stops at a breakpoint, which panel enables the
developer to assign values to variables prior to resuming the process?', '2025-08-27 02:31:16.074318', 'Debugging', NULL),
	(125, 1, 'A developer intends to incorporate a Flow Switch activity within a Flowchart. What is a characteristic of this activity?', '2025-08-27 02:31:34.028917', 'Advanced Control Flow', NULL),
	(126, 1, '“Process A” is scheduled to run at 2:00 PM using a time trigger with the Schedule ending of job execution feature configured to stop the job after
20 minutes. Assuming that the robots are busy and “Process A” is queued until 2:05 PM, at what time will “Process A” be stopped?', '2025-08-27 02:31:48.47076', 'Orchestrator', NULL),
	(127, 1, 'Which part of a test case that is using BDD (Behavioral-Driven Development) template structure supports the Surround with mock feature?', '2025-08-27 02:32:00.911525', 'Debugging', NULL),
	(128, 1, 'A developer is using a Type Into activity with the Input Method set to Simulate. Which property needs to be enabled for the activity to execute
even if the target UI element is deactivated or read-only?', '2025-08-27 02:32:15.358414', 'Advanced UI Automation', NULL),
	(129, 1, 'Which of the following options is true about the types of robot installation?', '2025-08-27 02:32:28.210064', 'Attended Automation', NULL),
	(130, 1, 'What is the purpose of the Relative To feature in Computer Vision activities?', '2025-08-27 02:32:44.52558', 'Advanced UI Automation', NULL),
	(131, 1, 'What can be verified in the InitAllSettingsTestCase test case?', '2025-08-27 02:32:58.404923', 'REFramework', NULL),
	(132, 1, 'Where is the TransactionNumber incremented in the REFramework?', '2025-08-27 02:33:11.372446', 'REFramework', NULL),
	(133, 1, 'Which of the following activities in UiPath Studio have the Verify Execution property available?', '2025-08-27 02:33:29.953998', 'Debugging', NULL),
	(134, 1, 'Given the following workflow:
(Image)

What will be the output of the Log Message activity?', '2025-08-27 02:34:19.331517', 'Advanced Data Manipulation', 'https://i.ibb.co/5x9y6qx8/imagem-2025-08-27-023416030.png'),
	(135, 1, 'In the context of a process automated using the REFramework that processes payments and sends a report using the Finance team leader''s email
account at the end of the day, where should the email account credentials be stored according to best practices?', '2025-08-27 02:34:31.998969', 'REFramework', NULL),
	(136, 1, 'A developer needs to choose a layout that integrates activities into a working structure during workflow file development. The selected layout
should cover all possible cases and transitions while accommodating processes that cannot be easily captured by loops and if statements.
Which of the following layouts is the best-suited in this case?', '2025-08-27 02:34:45.44244', 'Advanced Control Flow', NULL),
	(137, 1, 'A developer has created a variable of type String called “MyNumbers” and assigned to it the following value: “1, 2, 3, 4, 5, 6”. What is the
resulting data type for the expression MyNumbers.Split(“,”c)(1)?', '2025-08-27 02:35:00.987672', 'Advanced Data Manipulation', NULL),
	(138, 1, 'What are the possible statuses after running any REFramework test case?', '2025-08-27 02:36:19.950884', 'REFramework', NULL),
	(139, 1, 'Why is it necessary to add the UiPath virtual channel to the allow list policy for Citrix Virtual Apps and Desktops 7 2109?', '2025-08-27 02:36:35.021492', 'Advanced UI Automation', NULL),
	(140, 1, 'A developer plans to create a process to automate a web application using the Firefox browser. The goal is to have the robot work with the web
application without relying on visual elements on screen.
To achieve this goal, what option should the developer use for the Use Application/Browser activity?', '2025-08-27 02:36:49.657544', 'Advanced UI Automation', NULL),
	(141, 1, 'What information is provided in the Descriptor Coverage sub-panel of Test Explorer?', '2025-08-27 02:37:13.953653', 'Debugging', NULL),
	(142, 1, 'How to make sure that all UI Automation activities used within project workflows reference elements from the Object Repository?', '2025-08-27 02:37:27.614629', 'Advanced UI Automation', NULL),
	(143, 1, 'A developer designed a project in the REFramework. The “Config.xisx” has the following Setting entry:
(Image)

Assuming the default REFramework configuration, how can the developer reference the Setting in the Config variable to obtain the Setting value
as a String from the dictionary?', '2025-08-27 02:38:01.37249', 'REFramework', 'https://i.ibb.co/FbRVLQkG/imagem-2025-08-27-023759109.png'),
	(144, 1, 'What are the two types of events supported by Integration Service?', '2025-08-27 02:38:20.585588', 'Other advanced concepts', NULL),
	(145, 1, 'A developer extracts a date from an email. The date will always be in the same format and always from the past. Some examples of this format
are: “3 Mar 2023”, “20 Nov 2021”. The name of the variable where the date is saved is DateString. What expression should the developer use to
check if the extracted date is within the last 7 days?', '2025-08-27 02:39:01.578171', 'Advanced Data Manipulation', NULL),
	(146, 1, 'Given the following conditional breakpoint with count = 0:

(Image 1)

Conditional breakpoint settings:

(Image 2)

How many times will UiPath be displayed in the Output panel before the process goes into a Paused state in Debug mode?', '2025-08-27 02:39:59.819177', 'Debugging', 'https://i.ibb.co/9DLDw04/imagem-2025-08-27-023943031.png||https://i.ibb.co/0RrfFVDz/imagem-2025-08-27-023950069.png'),
	(147, 1, 'In a UiPath State Machine, what is the primary function of the Trigger section of a State activity?', '2025-08-27 02:40:11.769667', 'Advanced Control Flow', NULL),
	(148, 1, 'Which activity is specific for UI synchronization in UiPath Studio?', '2025-08-27 02:40:24.717601', 'Advanced UI Automation', NULL),
	(149, 1, 'A developer needs to design a process using the REFramework, but without Orchestrator Queues. Which is the correct order of actions the
developer needs to do in the Get Transaction Data state in this case?', '2025-08-27 02:40:39.254337', 'REFramework', NULL),
	(150, 1, 'Based on the following exhibit, which output is displayed in the Output panel if Step Out is clicked on the Debug ribbon tab of UiPath Studio?

(Image 1)', '2025-08-27 02:42:09.899886', 'Debugging', 'https://i.ibb.co/nMkcJsHb/imagem-2025-08-27-024109943.png'),
	(151, 1, 'What functionality does the Step Out action offer when a developer is reviewing a process during debugging, as shown in the exhibit?

(Image)', '2025-08-27 02:42:42.727876', 'Debugging', 'https://i.ibb.co/Kc0mH7C3/imagem-2025-08-27-024231978.png'),
	(152, 1, 'What is a prerequisite for performing Remote Debugging using an Unattended Robot connection?', '2025-08-27 02:43:00.382165', 'Debugging', NULL),
	(153, 1, 'What is the default OCR engine used in CV Screen Scope?', '2025-08-27 02:43:17.783441', 'Advanced UI Automation', NULL),
	(154, 1, 'Which of the following sections are part of the Final State in a State Machine?', '2025-08-27 02:43:31.302507', 'Advanced Control Flow', NULL),
	(155, 1, 'Which are the actions that can be done in Test Explorer?', '2025-08-27 02:43:44.078139', 'Debugging', NULL),
	(156, 1, 'In a UiPath development scenario, which type of process design would be the most appropriate for an automation task that executes actions in a
straightforward progression without iteration or branching?', '2025-08-27 02:43:58.25516', 'Advanced Control Flow', NULL),
	(157, 1, 'You have to create a testcase for an attended RPA process. At some point, the attended process asks the user to input a specific token for the
execution to continue, as shown in the screenshot below.

(Image)

What testing concept (included in UiPath.Testing.Activities) can be used to isolate and replace the input part, without modifying the original
workflow?', '2025-08-27 02:44:37.931536', 'Debugging', 'https://i.ibb.co/4nv1crxB/imagem-2025-08-27-024426088.png'),
	(158, 1, 'What specific combination of permissions is required to disable errors from the Error Feed widget on the Monitoring > Jobs page in UiPath
Orchestrator Monitoring?', '2025-08-27 02:44:53.042429', 'Orchestrator', NULL),
	(159, 1, 'Which of the following examples accurately demonstrates the correct usage of AI Computer Vision features in a UiPath project?', '2025-08-27 02:45:05.998336', 'Advanced UI Automation', NULL),
	(160, 1, 'A developer has designed a Performer process using the REFramework template in UiPath Studio. The process is published to an Orchestrator
folder named "FolderA" and a job is created in Orchestrator from the package. The value of the OrchestratorQueueName setting in "Config.xlsx"
is "QueueA" and the value of OrchestratorQueueFolder is ''''FolderA”.
The developer runs the job from Orchestrator with the following argument values:
in_OrchestratorQueueName = “QueueB"
in_OrchestratorQueueFolder = empty value
Which queue will be consumed by the robot?', '2025-08-27 02:45:24.032535', 'REFramework', NULL),
	(161, 1, 'What are the four job types present in the Job Type field according to the place of execution and robot impersonation?', '2025-08-27 02:45:37.567521', 'Attended Automation', NULL),
	(162, 1, 'A developer is using a Type Into activity with the input method property set to Simulate. Which property must be enabled for the activity to send
a Complete event when it has finished typing and trigger a Ul response from the target application?', '2025-08-27 02:45:50.123505', 'Advanced UI Automation', NULL),
	(163, 1, 'The following table is stored in a variable called "dt".
(Image)

Which query can be used to extract the table column names and store them in a list?', '2025-08-27 02:46:21.286734', 'Advanced Data Manipulation', 'https://i.ibb.co/bRPT4hrN/imagem-2025-08-27-024619073.png'),
	(164, 1, 'In the context of a UiPath State Machine, what is the primary purpose of the Exit action in a state?', '2025-08-27 02:46:36.597289', 'Advanced Control Flow', NULL),
	(200, 1, 'In UiPath Solutions Management, what type of components can be included in a solution bundle to automate a business use case?', '2025-08-27 03:02:27.206764', 'Orchestrator', NULL),
	(166, 1, 'While troubleshooting a process developed using the Robotic Enterprise (RE) Framework, you have placed a breakpoint at the "Invoke
InitAllSettings" workflow activity.
(Image)

Given the current state of the Executor, what will occur when you click on the Step Over button?', '2025-08-27 02:47:38.473879', 'REFramework', 'https://i.ibb.co/PvQ7wmT5/imagem-2025-08-27-024735665.png'),
	(167, 1, 'A developer needs to use the REFramework in order to implement a linear process. Which value should be set to “out_TransactionItem” the first
time when it enters the Get Transaction Data state?', '2025-08-27 02:47:53.157537', 'REFramework', NULL),
	(168, 1, 'What is the recommended approach for a user to log custom information at each breakpoint while executing a process in Debug mode?', '2025-08-27 02:48:06.887486', 'Debugging', NULL),
	(169, 1, 'In the Global Exception Handler, which arguments are provided by default and should not be removed?', '2025-08-27 02:48:18.762303', 'REFramework', NULL),
	(170, 1, 'Given the following variables assignments:
(Image)

What will the output of the following conditional be: outputX = If(Clnt(doubleX + CDbl(intX) + CDbl(stringX)) > 38.30, 1, 0)', '2025-08-27 02:48:54.572161', 'Advanced Data Manipulation', 'https://i.ibb.co/XZ4RfpDr/imagem-2025-08-27-024852469.png'),
	(171, 1, 'Which of the options below is not an action in Test Explorer?', '2025-08-27 02:49:25.370175', 'Debugging', NULL),
	(172, 1, 'An error occurs during the Initialization state within the “Framework\InitAllSettings.xaml” file for a process using REFramework which is
executed on Orchestrator. The project contains default values for the settings specified in “Config.xlsx”.
What is the current state of the job in Orchestrator?', '2025-08-27 02:49:38.274461', 'REFramework', NULL),
	(173, 1, 'Which of the following is a tag in a selector?', '2025-08-27 02:50:17.38567', 'Advanced UI Automation', NULL),
	(174, 1, 'How are custom log fields used in the REFramework?', '2025-08-27 02:50:32.806347', 'REFramework', NULL),
	(175, 1, 'When building automation projects, which statement is true regarding Perform Remote Debugging?', '2025-08-27 02:50:45.892689', 'Debugging', NULL),
	(176, 1, 'What are the five severity levels of Orchestrator alerts?', '2025-08-27 02:52:12.228669', 'Orchestrator', NULL),
	(177, 1, 'What are the differences between the properties Input mode: Simulate and Input mode: Window Messages on a Type Into activity?', '2025-08-27 02:52:33.986956', 'Advanced UI Automation', NULL),
	(178, 1, 'Which of the following is an accurate example of using LINQ for querying data in a UiPath process?', '2025-08-27 02:52:55.577353', 'Advanced Data Manipulation', NULL),
	(179, 1, 'Which major sections can be added or modified in the State activity of a UiPath project that uses State Machines?', '2025-08-27 02:53:14.724749', 'Advanced Control Flow', NULL),
	(180, 1, 'Which activity from the Microsoft 365 package should be used to retrieve the DriveItem ID for a Sharepoint URL?', '2025-08-27 02:53:32.588002', 'Advanced UI Automation', NULL),
	(181, 1, 'What is the primary role of the UiPath Remote Runtime component in automation projects involving virtual environments?', '2025-08-27 02:53:47.537426', 'Other advanced concepts', NULL),
	(182, 1, 'When building an automation for a car rental company as part of a larger project initiative, a developer should follow the high-level steps:
1. Log in to the company''s desktop application.
2. For each Queue Item:
a. Navigate to the Reservations section from the Requests section. b. Add the reservation data to the Reservations section. c. Close the current
reservation.
3. Log out and close the company''s application.
What step should be mocked from the end-to-end test case in order to retrieve test data?', '2025-08-27 02:54:18.619652', 'REFramework', NULL),
	(183, 1, 'How do you subtract a specific TimeSpan from "Today" in VB.NET?', '2025-08-27 02:54:35.155746', 'Advanced Data Manipulation', NULL),
	(184, 1, 'Which features does the Connector Builder for Integration Service support?', '2025-08-27 02:55:10.49649', 'Other advanced concepts', NULL),
	(185, 1, 'A developer implemented a process using the REFramework and an Orchestrator queue. The "OrchestratorQueueFolder" was defined in the
"Config.xlsx" file, but the folder does not exist in Orchestrator.
What is the behavior at runtime?', '2025-08-27 02:55:23.938814', 'REFramework', NULL),
	(186, 1, 'In the context of UiPath Orchestrator, what is the primary purpose of the Monitoring feature?', '2025-08-27 02:56:14.866642', 'REFramework', NULL),
	(187, 1, 'Assume we have the Verify Expression with Operator activity from the UiPath.Testing.Activities package with the properties configured as
follows:

(Image 1)

The activity is used within a Try-Catch activity. The Catch block is set to System.Exception and
UiPath.Testing.Exception.TestingActivitiesException as shown in the screenshot below:

(Image 2)

During the execution of the sequence shown above, which block from the Try-Catch activity will be entered first, after the Verify Expression with
Operator activity is executed?', '2025-08-27 02:57:35.167722', 'Debugging', 'https://i.ibb.co/27KRnjrk/imagem-2025-08-27-025713776.png||https://i.ibb.co/5g9cksFx/imagem-2025-08-27-025720955.png'),
	(188, 1, 'Under what conditions will a trigger be automatically disabled upon failure in Integration Service?', '2025-08-27 02:57:47.964893', 'REFramework', NULL),
	(189, 1, 'While developing a test case using UiPath.Testing.Activities, which testing activity enables to include another activity within its body?', '2025-08-27 02:57:59.94473', 'Debugging', NULL),
	(190, 1, 'Suppose you have the following workflow that verifies if the text value of an element is equal to "Work Items":

(Image 1)

The configuration for the Verify Control Attribute and Get Text activities is shown below:

(Image 2)

The element and its selector are highlighted in the image below:

(Image 3)

Taking into consideration that the page shown above will be present on screen at execution time, what will be the result of the Verify Control
Attribute activity?', '2025-08-27 03:00:08.491232', 'Debugging', 'https://i.ibb.co/RGDL92cG/imagem-2025-08-27-025857567.png||https://i.ibb.co/nMx01tJM/imagem-2025-08-27-025924227.png||https://i.ibb.co/tPD5Ykm1/imagem-2025-08-27-025940967.png'),
	(191, 1, 'Which of the following examples accurately demonstrates using LINQ to perform data operations in a UiPath process?', '2025-08-27 03:00:19.974607', 'Advanced Data Manipulation', NULL),
	(192, 1, 'What is created automatically when you create a coded automation in UiPath?', '2025-08-27 03:00:40.943533', 'REFramework', NULL),
	(193, 1, 'If a queue transaction does not have a recording available, what is the most likely reason?', '2025-08-27 03:00:55.866838', 'Other advanced concepts', NULL),
	(194, 1, 'Where in the REFramework template project is the "SetTransactionStatus.xaml" invoked?', '2025-08-27 03:01:08.429527', 'REFramework', NULL),
	(195, 1, 'What does the Profile Execution tool in UiPath Studio do?', '2025-08-27 03:01:19.893732', 'Debugging', NULL),
	(196, 1, 'Which expression correctly converts the string variable “DateString” with the value “03/03/2023 03:23:11 AM” into a Date Time variable?', '2025-08-27 03:01:31.47712', 'Advanced Data Manipulation', NULL),
	(197, 1, 'You are developing a guided tour for a software product, designed to help users navigate the interface efficiently. The tour needs to trigger
automated actions based on how the user interacts with the software, such as clicking buttons or pressing keys.
What kind of triggers should you implement for this attended automation?', '2025-08-27 03:01:50.293915', 'Attended Automation', NULL),
	(198, 1, 'While using the Event Inspection Tool, you notice that a certain UI element event is continually interrupting your workflow by flooding your
event list. While the event recording is running, you decide to disable this event type.
Can this be done in UiPath Studio?', '2025-08-27 03:02:04.432171', 'Attended Automation', NULL),
	(203, 1, 'When performing Remote Debugging using an Unattended Robot connection, Studio sends the list of project dependencies to the remote robot.
From where does the remote robot download the required packages?', '2025-08-27 03:02:58.589328', 'Orchestrator', NULL),
	(204, 1, 'A long-running job was suspended waiting for an external task.
Once the task is completed, which robot is selected by Orchestrator to continue the job’s execution?', '2025-08-27 03:03:09.950701', 'Orchestrator', NULL),
	(205, 1, 'You are tasked with streamlining a multi-system financial reporting process. The process is time-consuming and creates inconsistencies due to
data shifting before completion.
How can you leverage UiPath Data Service to enhance this operation?', '2025-08-27 03:03:31.17421', 'REFramework', NULL),
	(206, 1, 'What HTTP verbs are supported in the Method field when using the UiPath.Core.Activities.OrchestratorHttpRequest activity?', '2025-08-27 03:03:40.594919', 'Orchestrator', NULL),
	(207, 1, 'You’re working in Studio and want to start a PiP process. Where can you start this process from?', '2025-08-27 03:03:51.707261', 'Attended Automation', NULL),
	(208, 1, 'A company needs to execute background automation without worrying about managing infrastructure. They want to scale easily and avoid
provisioning virtual machines. Based on the information provided, which type of UiPath Automation CloudTM robot should they use?', '2025-08-27 03:04:06.23899', 'Other advanced concepts', NULL),
	(209, 1, 'A developer implemented a process using the REFramework and an **Orchestrator** queue. The "OrchestratorQueueFolder" was defined in the
"Config.xlsx" file, but the folder does not exist in Orchestrator. What is the behavior at runtime?', '2025-08-27 03:04:18.925161', 'REFramework', NULL);
/*!40000 ALTER TABLE "questoes" ENABLE KEYS */;

-- Copiando estrutura para tabela app_simulado.respostas_usuario
CREATE TABLE IF NOT EXISTS "respostas_usuario" (
	"id" INTEGER NOT NULL,
	"simulado_id" INTEGER NOT NULL,
	"questao_id" INTEGER NOT NULL,
	"opcao_escolhida_id" INTEGER NOT NULL,
	"data_resposta" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	CONSTRAINT "respostas_usuario_ibfk_1" FOREIGN KEY ("simulado_id") REFERENCES "simulados" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_2" FOREIGN KEY ("questao_id") REFERENCES "questoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE,
	CONSTRAINT "respostas_usuario_ibfk_3" FOREIGN KEY ("opcao_escolhida_id") REFERENCES "opcoes" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Copiando dados para a tabela app_simulado.respostas_usuario: 70 rows
/*!40000 ALTER TABLE "respostas_usuario" DISABLE KEYS */;
INSERT INTO "respostas_usuario" ("id", "simulado_id", "questao_id", "opcao_escolhida_id", "data_resposta") VALUES
	(5, 5, 1, 3, '2025-08-27 01:47:47.084328'),
	(6, 5, 2, 5, '2025-08-27 01:47:47.084328'),
	(7, 5, 6, 21, '2025-08-27 01:47:47.084328'),
	(8, 5, 7, 28, '2025-08-27 01:47:47.084328'),
	(9, 5, 9, 33, '2025-08-27 01:47:47.084328'),
	(11, 5, 16, 64, '2025-08-27 01:47:47.084328'),
	(12, 5, 18, 69, '2025-08-27 01:47:47.084328'),
	(13, 5, 20, 79, '2025-08-27 01:47:47.084328'),
	(14, 5, 21, 82, '2025-08-27 01:47:47.084328'),
	(15, 5, 22, 86, '2025-08-27 01:47:47.084328'),
	(16, 5, 24, 95, '2025-08-27 01:47:47.084328'),
	(17, 5, 25, 98, '2025-08-27 01:47:47.084328'),
	(18, 5, 27, 106, '2025-08-27 01:47:47.084328'),
	(19, 5, 28, 111, '2025-08-27 01:47:47.084328'),
	(20, 5, 29, 115, '2025-08-27 01:47:47.084328'),
	(21, 5, 30, 119, '2025-08-27 01:47:47.084328'),
	(22, 5, 32, 128, '2025-08-27 01:47:47.084328'),
	(23, 5, 33, 132, '2025-08-27 01:47:47.084328'),
	(24, 5, 34, 135, '2025-08-27 01:47:47.084328'),
	(25, 5, 35, 140, '2025-08-27 01:47:47.084328'),
	(26, 5, 36, 144, '2025-08-27 01:47:47.084328'),
	(27, 5, 38, 151, '2025-08-27 01:47:47.084328'),
	(28, 5, 39, 156, '2025-08-27 01:47:47.084328'),
	(29, 5, 41, 161, '2025-08-27 01:47:47.084328'),
	(30, 5, 42, 165, '2025-08-27 01:47:47.084328'),
	(31, 5, 43, 170, '2025-08-27 01:47:47.084328'),
	(32, 5, 44, 175, '2025-08-27 01:47:47.084328'),
	(33, 5, 45, 178, '2025-08-27 01:47:47.084328'),
	(34, 5, 46, 184, '2025-08-27 01:47:47.084328'),
	(35, 5, 48, 191, '2025-08-27 01:47:47.084328'),
	(36, 5, 49, 196, '2025-08-27 01:47:47.084328'),
	(37, 5, 51, 203, '2025-08-27 01:47:47.084328'),
	(38, 5, 53, 209, '2025-08-27 01:47:47.084328'),
	(39, 5, 54, 216, '2025-08-27 01:47:47.084328'),
	(40, 5, 56, 221, '2025-08-27 01:47:47.084328'),
	(41, 5, 57, 227, '2025-08-27 01:47:47.084328'),
	(42, 5, 58, 231, '2025-08-27 01:47:47.084328'),
	(43, 5, 61, 242, '2025-08-27 01:47:47.084328'),
	(44, 5, 62, 245, '2025-08-27 01:47:47.084328'),
	(45, 5, 63, 249, '2025-08-27 01:47:47.084328'),
	(46, 5, 64, 255, '2025-08-27 01:47:47.084328'),
	(47, 5, 65, 257, '2025-08-27 01:47:47.084328'),
	(48, 5, 68, 272, '2025-08-27 01:47:47.084328'),
	(49, 5, 70, 280, '2025-08-27 01:47:47.084328'),
	(50, 5, 71, 282, '2025-08-27 01:47:47.084328'),
	(51, 5, 72, 286, '2025-08-27 01:47:47.084328'),
	(52, 5, 73, 290, '2025-08-27 01:47:47.084328'),
	(53, 5, 75, 300, '2025-08-27 01:47:47.084328'),
	(54, 5, 78, 311, '2025-08-27 01:47:47.084328'),
	(55, 5, 79, 316, '2025-08-27 01:47:47.084328'),
	(56, 5, 81, 321, '2025-08-27 01:47:47.084328'),
	(57, 5, 82, 326, '2025-08-27 01:47:47.084328'),
	(58, 5, 83, 332, '2025-08-27 01:47:47.084328'),
	(59, 5, 84, 336, '2025-08-27 01:47:47.084328'),
	(60, 5, 85, 339, '2025-08-27 01:47:47.084328'),
	(61, 5, 86, 343, '2025-08-27 01:47:47.084328'),
	(62, 5, 87, 346, '2025-08-27 01:47:47.084328'),
	(63, 5, 88, 351, '2025-08-27 01:47:47.084328'),
	(64, 5, 91, 364, '2025-08-27 01:47:47.084328'),
	(65, 5, 92, 365, '2025-08-27 01:47:47.084328'),
	(66, 5, 94, 374, '2025-08-27 01:47:47.084328'),
	(67, 5, 95, 377, '2025-08-27 01:47:47.084328'),
	(68, 5, 96, 384, '2025-08-27 01:47:47.084328'),
	(69, 5, 98, 392, '2025-08-27 01:47:47.084328'),
	(70, 5, 99, 394, '2025-08-27 01:47:47.084328'),
	(71, 5, 101, 402, '2025-08-27 01:47:47.084328'),
	(72, 5, 103, 410, '2025-08-27 01:47:47.084328'),
	(73, 5, 104, 416, '2025-08-27 01:47:47.084328');
/*!40000 ALTER TABLE "respostas_usuario" ENABLE KEYS */;

-- Copiando estrutura para tabela app_simulado.simulados
CREATE TABLE IF NOT EXISTS "simulados" (
	"id" INTEGER NOT NULL,
	"aluno_id" INTEGER NOT NULL,
	"data_inicio" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	"data_fim" TIMESTAMP NULL DEFAULT NULL,
	"pontuacao" NUMERIC(5,2) NULL DEFAULT NULL,
	PRIMARY KEY ("id"),
	CONSTRAINT "simulados_ibfk_1" FOREIGN KEY ("aluno_id") REFERENCES "usuarios" ("id") ON UPDATE NO ACTION ON DELETE CASCADE
);

-- Copiando dados para a tabela app_simulado.simulados: 1 rows
/*!40000 ALTER TABLE "simulados" DISABLE KEYS */;
INSERT INTO "simulados" ("id", "aluno_id", "data_inicio", "data_fim", "pontuacao") VALUES
	(5, 1, '2025-08-27 01:47:47.084328', NULL, 35.00);
/*!40000 ALTER TABLE "simulados" ENABLE KEYS */;

-- Copiando estrutura para tabela app_simulado.usuarios
CREATE TABLE IF NOT EXISTS "usuarios" (
	"id" INTEGER NOT NULL,
	"nome" VARCHAR(100) NOT NULL,
	"email" VARCHAR(100) NOT NULL,
	"senha" VARCHAR(255) NOT NULL,
	"tipo_acesso" UNKNOWN NOT NULL DEFAULT 'aluno',
	"data_criacao" TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY ("id"),
	UNIQUE INDEX "usuarios_email_key" ("email")
);

-- Copiando dados para a tabela app_simulado.usuarios: -1 rows
/*!40000 ALTER TABLE "usuarios" DISABLE KEYS */;
INSERT INTO "usuarios" ("id", "nome", "email", "senha", "tipo_acesso", "data_criacao") VALUES
	(1, 'thiago', 'thiago@test.com', '$2a$10$jR2KVMgZmpA39FX/YiqgluAXiJTyraoq9qCaU7e1Z1gjbw2zkGIVa', 'admin', '2025-08-26 21:09:55.251928');
/*!40000 ALTER TABLE "usuarios" ENABLE KEYS */;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
