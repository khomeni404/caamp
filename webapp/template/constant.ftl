<#assign STAFF = 'Staff'/>
<#assign STUDENT = 'Student'/>



<#assign PROPERTY_GROUP_NAMES = '10'/>
<#assign BENEFICIARY_TYPES = '11'/>
<#assign BOARD_NAMES = '12'/>
<#assign BRANCH_RECOMMENDATIONS = '13'/>
<#assign CHALLENGE_TYPES = '14'/>
<#assign SEX_TYPES = '15'/>
<#assign HOUSE_TYPES = '16'/>
<#assign STUDENT_TYPES = '17'/>
<#assign SECTOR_TYPES = '18'/>
<#assign SUB_SECTOR_TYPES = '19'/>
<#assign RESIDENT_TYPES = '20'/>
<#assign RELIGION_TYPES = '21'/>
<#assign MARITAL_STATUSES = '22'/>
<#assign INSTITUTE_TYPES = '23'/>
<#assign INSTITUTE_LOCATIONS = '24'/>
<#assign PARENT_EDUCATIONS = '25'/>
<#assign PARENT_STATES = '26'/>
<#assign MONTH_NAMES = '27'/>
<#assign ZONE_NAMES = '28'/>
<#assign DIVISION_NAMES = '29'/>
<#assign PROJECT_LEVEL = '30'/>
<#assign PROJECT_STATUS = '31'/>
<#assign DOC_INDICATOR = '32'/>

<#--
public static void pringMapFiledName(String args[]) {
    Class<Constants> c = Constants.class;
    for (Field f : c.getDeclaredFields()) {
        int mod = f.getModifiers();
        if (Modifier.isStatic(mod) && Modifier.isPublic(mod) && Modifier.isFinal(mod)) {
            try {
                if (f.getGenericType().getTypeName().equals("java.util.Map<java.lang.String, java.lang.String>") && f.getType().equals(Map.class)) {
                    String name = f.getName();
                    System.out.println("<#assign "+name+" = '"+name+"'/>");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
-->