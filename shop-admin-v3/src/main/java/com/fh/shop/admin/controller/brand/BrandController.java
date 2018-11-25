package com.fh.shop.admin.controller.brand;

import com.fh.shop.admin.annotation.Log;
import com.fh.shop.admin.biz.brand.IBrandServive;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Brand;
import com.fh.shop.admin.servlet.SystemConstant;
import com.fh.shop.admin.util.FileUtil;
import org.apache.commons.lang.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
public class BrandController {


    @Autowired
    private IBrandServive brandServive;

    @Autowired
    private HttpServletRequest request;

    //跳转
    @RequestMapping("/toBrandList")
    public String toBrandList(){
        return "/brand/brandList";
    }

    //跳转到新增品牌页面
    @RequestMapping("/brand/toAdd")
    public String toAdd(){
        return "/brand/addBrand";
    }

    //fileinput文件上传
    @RequestMapping("/fileinput")
    @ResponseBody
    public ServerResponse fileinput(@RequestParam MultipartFile photo ) throws IOException {
        InputStream inputStream = photo.getInputStream();
        String originalFilename = photo.getOriginalFilename();
        //文件拷贝
        FileUtil.copyFile(inputStream,originalFilename,request.getServletContext().getRealPath(SystemConstant.BRAND_LOGO_PATH));
        return ServerResponse.success();
    }

    @RequestMapping("/brand/addBrands")
    @ResponseBody
    public ServerResponse addBrands(@RequestBody List<Brand> brands){
        brandServive.addBrands(brands);
        return ServerResponse.success();
    }


    //查询品牌列表
    @RequestMapping("/brand/list")
    @ResponseBody
    @Log("查询品牌列表")
    public ServerResponse findBrandList(Brand brand,int draw){

        if (null != brand) {
            if (StringUtils.isNotBlank(brand.getBrandName())) {
               brand.setBrandName("%"+brand.getBrandName()+"%");
            }
        }

        Map resultMap = new HashMap();
        //查询分页总条数
        int count = brandServive.findBrandCount(brand);
        //查询品牌
        List<Brand> brandList = brandServive.findBrandList(brand);
        resultMap.put("draw", draw);
        resultMap.put("data", brandList);
        resultMap.put("recordsTotal", count);
        resultMap.put("recordsFiltered", count);
        return ServerResponse.success(resultMap);
    }

       //增加品牌
    @RequestMapping("/brand/add")
    @ResponseBody
    @Log("增加品牌")
    public ServerResponse addBrand(Brand brand){
        brandServive.addBrand(brand);
        return ServerResponse.success(brand);
    }
    //上传图片
    @RequestMapping("/brand/flieinput")
    @ResponseBody
    public ServerResponse flieinput(@RequestParam("photo") CommonsMultipartFile photo,HttpServletRequest request ){
        //得到文件原始名
        String originalFilename = photo.getOriginalFilename();
        //得到后缀名
        int lastIndexOf  = originalFilename.lastIndexOf(".");
        //重命名
        String newphotoName = UUID.randomUUID()+originalFilename.substring(lastIndexOf);

        //转存
        String path = request.getSession().getServletContext().getRealPath("/")+"//upload";
        File file = new File(path);
        if (!file.exists()){
            file.mkdirs();
        }
        try {
            photo.transferTo(new File(path+"//"+newphotoName));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return ServerResponse.success("upload//"+newphotoName);
    }


    //删除品牌
    @RequestMapping("/brand/deleteBrand")
    @ResponseBody
    @Log("删除品牌")
    public ServerResponse deleteBrand(@RequestParam("idList[]") List<Integer> ids){
        brandServive.deleteBrand(ids);
        return ServerResponse.success();
    }


//修改品牌信息
    @RequestMapping("/brand/queryBrandById")
    @ResponseBody
    @Log("修改回显")
    public ServerResponse queryBrandById(Brand brand) {
        brand = brandServive.queryBrandById(brand.getId());
        return ServerResponse.success(brand);
    }



}