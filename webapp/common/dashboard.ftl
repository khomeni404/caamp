<#import "../open_temp_o/open_layout.ftl" as layout>
<@layout.open_layout "${(title)!}", 'dashboard'>
    <#assign ctx = rc.getContextPath()/>
<div class="span6">
    <div class="widget">
        <div class="widget-header">
            <i class="icon-bar-chart"></i>
            <h3>${title!}</h3>
        </div>
        <!-- /widget-header -->
        <div class="widget-content">
            <div class="span6">
                Islami Bank Scholarship 2017
                Islami Bank Scholarship 2017 for SSC & HSC Students, who have passed in SSC and HSC exam. Who are illegible to apply for Islami Bank Bangladesh Ltd Scholarship they can apply. Only Poor and talented students can apply for Islamic Bank Scholarship 2017.

                Islami Bank Bangladesh Ltd Scholarship for SSC and HSC Level Passed Students. Therefore, Islami Bank Bangladesh Ltd Scholarship 2017 year is available at IBBL website islamibankbd.com and our website as well. Islami Bank Bangladesh Ltd (IBBL) has been invited application from poor but meritorious student who has passed SSC & HSC Students exam in 2017 for IBBL Scholarship 2017.
            </div>

            <form style="display: none">
                <div class="form-group">
                    <label for="email">Email address:</label>
                    <input type="email" class="form-control" id="email">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <input type="password" class="form-control" id="pwd">
                </div>
                <div class="form-group">
                    <label for="pwd">Password:</label>
                    <select name="" id="">
                        <option value="">Jemmie</option>
                        <option value="">Jemmie 3</option>
                    </select>
                </div>
                <div class="checkbox">
                    <label><input type="checkbox"> Remember me</label>
                </div>
                <button type="submit" class="btn btn-success">Submit</button>
            </form>
        </div>
        <!-- /widget-content -->
    </div>
    <!-- /widget -->
</div>
</@layout.open_layout>