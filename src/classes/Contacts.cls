/**
 * -----------------------------------------------------------------------------
 * COPYRIGHT (C) 2017, FONTEVA, INC.
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
 *
 * Domain class for the Contact SObjectType
 * @author Vishal Shah
 *
 * This is a Sample class
 **/
 
 
global with sharing class Contacts extends Framework.Domain {

    public Contacts(List<Contact> sObjectList) {
        super(sObjectList);
    }

    global class Constructor implements Framework.Domain.DomainConstructor {
        global Framework.Domain construct(List<SObject> sObjectList) {
            return new Contacts(sObjectList);
        }
    }

    // Runs for every trigger context
    public override void applyDefaults() {
        Framework.Log.push(Contacts.class.getName(),'applyDefaults');

        // Call Service class method to apply defaults
        // context records are available as an SObject[]
        // and the variable is `records`
     
        //e.g. ContactService.applyDefaults((Contact[]) records);
        
        Framework.Log.pop();
    }

    public override void beforeInsert() {
        Framework.Log.push(Contacts.class.getName(),'beforeInsert');
        
        // Call Service class method for before insert
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }

    public override void beforeUpdate(Map<Id,SObject> oldMap) {
        Framework.Log.push(Contacts.class.getName(),'beforeUpdate');
                
        // Call Service class method for before update
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }

    public override void afterInsert() {
        Framework.Log.push(Contacts.class.getName(),'afterInsert');

        // Call Service class method for after insert
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }

    public override void afterUpdate(Map<Id,SObject> oldMap) {
        Framework.Log.push(Contacts.class.getName(),'afterUpdate');

        // Call Service class method for after update
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }

    public override void beforeDelete(Map<Id,SObject> oldMap) {
        Framework.Log.push(Contacts.class.getName(),'beforeDelete');

        // Call Service class method for before delete
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }


    public override void afterDelete() {
        Framework.Log.push(Contacts.class.getName(),'afterDelete');

        // Call Service class method for after delete
        // context records are available as an SObject[]
        // and the variable is `records`

        Framework.Log.pop();
    }
    
    // Call this to implement custom validation
    // for before context
    public override void validate() {
        Framework.Log.push(Contacts.class.getName(),'validate');
        
        // Call Service class method for validation
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }

    // Call this to implement custom validation
    // for after context
    public override void validate(Map<Id,SObject> oldMap) {
        Framework.Log.push(Contacts.class.getName(),'validate');
        
        // Call Service class method for validation
        // context records are available as an SObject[]
        // and the variable is `records`
        
        Framework.Log.pop();
    }
}
