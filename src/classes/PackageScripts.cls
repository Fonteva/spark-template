/**
 * -----------------------------------------------------------------------------
 * COPYRIGHT (C) 2016, FONTEVA, INC.
 * ALL RIGHTS RESERVED.
 *
 * ALL SOURCE CODE CONTAINED HEREIN IS, AND REMAINS THE PROPERTY OF FONTEVA
 * INCORPORATED AND ITS SUPPLIERS, IF ANY. THE INTELLECTUAL AND TECHNICAL
 * CONCEPTS CONTAINED HEREIN ARE PROPRIETARY TO FONTEVA INCORPORATED AND
 * ITS SUPPLIERS AND MAY BE COVERED BY U.S. AND FOREIGN PATENTS, PATENTS IN
 * PROCESS, AND ARE PROTECTED BY TRADE SECRET OR COPYRIGHT LAW. DISSEMINATION
 * OF THIS SOURCE CODE OR REPRODUCTION OF THIS MATERIAL IS STRICTLY FORBIDDEN
 * UNLESS PRIOR WRITTEN PERMISSION IS OBTAINED FROM FONTEVA, INC.
 * -----------------------------------------------------------------------------
 *
 * Register App, Objects and Routing Rules
 *
 * @author Vishal Shah
 **/
global class PackageScripts{


    /**
     * Execute the installation scripts for the Customer Implementation
     */
    global static void install() {
        new PackageScripts.Install().run();
    }


    global class Install implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.Install.class.getName(),'run');

            new AppConfig().run();
            new Register().run();
            new Rollups().run();

            Framework.Log.pop();
        }
    }


    global class AppConfig implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.AppConfig.class.getName(),'run');

            /**
             *
             * Do Org Config
             *
             */

            Framework.Log.pop();
        }
    }


    global class Register implements Framework.Scriptable {
        global void run() {

            //------------- Begin: Registering App-------------------//

            Framework.RegisteredApp ev = new Framework.RegisteredApp();
            ev.namespace = PackageUtils.namespace;
            ev.name = 'Customer Implementations';
            ev.description = 'Customer Implementations';
            ev.owner = 'Customer Implementations';
            ev.isManaged = true;
            ev.isEnabled = true;
            ev.installClass = PackageScripts.Install.class.getName();
            Framework.Config.push(ev);


            //------------- Begin: Registering objects (Alphabetical Order)-------------------//

            Framework.RegisteredObject[] regObjects = new List<Framework.RegisteredObject>();

            // Attendee__c Sample
            // ---------------------------------------------------------------------
            /** Framework.RegisteredObject att = new Framework.RegisteredObject();
             *  att.sObjectName = Framework.SchemaService.getDescribe(Attendee__c.SObjectType).getName();
             *  att.apexClass = Attendees.class.getName();
             *  att.namespace = PackageUtils.namespace;
             *  att.isEnabled = true;
             *  att.isStandard = false;
             *  att.triggersEnabled = true;
             *  att.soqlLimit = String.valueOf(2000);
             *  att.soqlOrderBy = SObjectType.Attendee__c.fields.Name.getName() + ' ASC';
             *  regObjects.add(att);
             */


            Framework.Config.push(regObjects);


            //------------- Begin: Routing Rules creation (Alphabetical Order)--------------------//
            Framework.RoutingRule[] rules = new List<Framework.RoutingRule>();

            // OrderApi__Assignment__c ** Routing Rule Extension ** Sample
            // ---------------------------------------------------------------------
            /** Framework.RoutingRule accPermission = new Framework.RoutingRule();
             *  accPermission.apexClass = AccessPermissions.class.getName();
             *  accPermission.namespace = PackageUtils.namespace;
             *  accPermission.isEnabled = true;
             *  accPermission.sObjectName = SObjectType.OrderApi__Access_Permission__c.getName();
             *  accPermission.executionOrder = 0;
             *  rules.add(accPermission);
             */

            Framework.Config.push(rules);

        }
    }

    global class Rollups implements Framework.Scriptable {
        global void run() {
            Framework.Log.push(PackageScripts.class.getName(),'.Scripts.createRollups');
            Framework.RollupSummaryField[] rsfs = new List<Framework.RollupSummaryField>();

            /**
             * Event__c.Attendees__c (# of Registered Attendees) (Count) Sample
             */
            /** Framework.RollupSummaryField rsf = new Framework.RollupSummaryField();
             *  rsf.namespace = PackageUtils.namespace;
             *  rsf.childField = SObjectType.Attendee__c.fields.Id.getName();
             *  rsf.childSObject = SObjectType.Attendee__c.getName();
             *  String sFilter;
             *  sFilter = SObjectType.Attendee__c.fields.Status__c.getName() + ' = \'Registered\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Checked In\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Transferred\' ';
             *  sFilter += ' OR ' + SObjectType.Attendee__c.fields.Status__c.getName() + '= \'Invited\' ';
             *  rsf.filter = sFilter;
             *  rsf.operation = Framework.RollupSummaryField.Operation.Count.name();
             *  rsf.parentField = Framework.SchemaService.getDescribe(Event__c.Attendees__c).getName();
             *  rsf.parentSObject = Framework.SchemaService.getDescribe(Event__c.SObjectType).getName();
             *  rsf.relationshipField = Framework.SchemaService.getDescribe(Attendee__c.Event__c).getName();
             *  rsf.isEnabled = true;
             *  rsfs.add(rsf);
             */

            Framework.Config.push(rsfs);
            Framework.Log.pop();
        }
    }

}