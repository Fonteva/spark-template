/*
* -----------------------------------------------------------------------------
* COPYRIGHT (C) 2016, FONTEVA, INC.
* ALL RIGHTS RESERVED.
*
* ALL INFORMATION CONTAINED HEREIN IS, AND REMAINS THE PROPERTY OF FONTEVA
* INCORPORATED AND ITS SUPPLIERS, IF ANY. THE INTELLECTUAL AND TECHNICAL
* CONCEPTS CONTAINED HEREIN ARE PROPRIETARY TO FONTEVA INCORPORATED AND
* ITS SUPPLIERS AND MAY BE COVERED BY U.S. AND FOREIGN PATENTS, PATENTS IN
* PROCESS, AND ARE PROTECTED BY TRADE SECRET OR COPYRIGHT LAW. DISSEMINATION
* OF THIS INFORMATION OR REPRODUCTION OF THIS MATERIAL IS STRICTLY FORBIDDEN
* UNLESS PRIOR WRITTEN PERMISSION IS OBTAINED FROM FONTEVA, INC.
* -----------------------------------------------------------------------------
*/

/**
*  Service for Sobjects(Insert, update, Delete, Upsert)
*  @author Sandeep Peddireddy, Vishal Shah
*/

public with sharing class SObjectService {

    public static final String INSUFFICIENT_ACCESS = 'Insufficient Access';

    public static void insertRecord(SObject obj) {
        insertRecords(new List<SObject>{obj}, obj.getSObjectType());
    }

    public static void insertRecords(SObject[] objects) {
        insertRecords(objects, objects.getSObjectType());
    }

    public static void insertRecords(SObject[] objects, SObjectType objectType) {
        Framework.Log.push(SobjectService.class.getName(),'insertRecords - ' + objects.getSObjectType());
        if (Framework.SchemaService.checkObjectAccess(objectType, true, false, false)) {
            insert objects;
        } else {
            throw(new SObjectException(INSUFFICIENT_ACCESS));
        }
        Framework.Log.pop();
    }

    public static void updateRecord(SObject obj) {
        updateRecords(new List<SObject>{obj}, obj.getSObjectType());
    }

    public static void updateRecords(SObject[] objects) {
        updateRecords(objects, objects.getSObjectType());
    }

    public static void updateRecords(SObject[] objects, SObjectType objectType) {
        Framework.Log.push(SobjectService.class.getName(),'updateRecords - ' + objects.getSObjectType());
        if (Framework.SchemaService.checkObjectAccess(objectType, false, true, false)) {
            update objects;
        } else {
            throw(new SObjectException(INSUFFICIENT_ACCESS));
        }
        Framework.Log.pop();
    }

    public static void deleteRecord(SObject obj) {
        deleteRecords(new List<SObject>{obj}, obj.getSObjectType());
    }

    public static void deleteRecords(SObject[] objects) {
        deleteRecords(objects, objects.getSObjectType());
    }

    public static void deleteRecords(SObject[] objects, SObjectType objectType) {
        Framework.Log.push(SobjectService.class.getName(),'deleteRecords - ' + objects.getSObjectType());
        if (Framework.SchemaService.checkObjectAccess(objectType, false, false, true)) {
            delete objects;
        } else {
            throw(new SObjectException(INSUFFICIENT_ACCESS));
        }
        Framework.Log.pop();
    }

    public static void upsertRecord(SObject obj) {
        upsertRecords(new List<SObject>{obj}, obj.getSObjectType());
    }

    public static void upsertRecords(SObject[] objects) {
        upsertRecords(objects, objects.getSObjectType());
    }

    public static void upsertRecords(SObject[] objects, SObjectType objectType) {
        Framework.Log.push(SobjectService.class.getName(),'upsertRecords - ' + objects.getSObjectType());
        if (Framework.SchemaService.checkObjectAccess(objectType, true, true, false)) {
            upsert objects;
        } else {
            throw(new SObjectException(INSUFFICIENT_ACCESS));
        }
        Framework.Log.pop();
    }

    public class SobjectException extends Exception {
    }
}