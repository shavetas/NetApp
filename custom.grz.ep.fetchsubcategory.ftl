<#assign CatId = http.request.parameters.name.get("catId",'') >
<#assign topCategories = rest("2.0", "/search?q=" + "SELECT * FROM categories WHERE parent_category.id = '${CatId}' limit 12"?url).data.items >
<#if topCategories?size &gt; 0 > 
  <#list topCategories as cat>
      <div class="lia-quilt-column sub-category-wrapper lia-quilt-column-cs-4 lia-quilt-column-single lia-quilt-column padding-0">
          <div class="lia-quilt-column sub-category-card sub-category-card-${cat?counter}">
              <div class="text-content-center card-content">
                  <div class="title card-title">
                    <a href="${cat.view_href}">${cat.title}</a>
                  </div>
              </div>
          </div>
      </div>
  </#list >
<#else>
  <div class="lia-quilt-column text-content-center lia-quilt-column-24 lia-quilt-column-single lia-quilt-column padding-0">
      <div class="lia-quilt-column sub-category-card sub-category-card-1">
          No Sub Category Found
      </div>
  </div>
</#if>
