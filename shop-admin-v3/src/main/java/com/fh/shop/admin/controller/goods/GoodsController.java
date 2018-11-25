package com.fh.shop.admin.controller.goods;

import com.fh.shop.admin.annotation.Log;
import com.fh.shop.admin.biz.brand.IBrandServive;
import com.fh.shop.admin.biz.goods.IGoodsService;
import com.fh.shop.admin.common.ServerResponse;
import com.fh.shop.admin.po.Brand;
import com.fh.shop.admin.po.Department;
import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.po.GoodsType;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class GoodsController {

    @Autowired
    private IGoodsService goodsService;

    @Autowired
    private IBrandServive brandServive;

    //跳转
    @RequestMapping("/toGoodsList")
    public String toGoods(){
        return "/goods/goodsList";
    }

    //跳转
    @RequestMapping("/goods/toAdd")
    public String toAddGoods(){
        return "/goods/add";
    }

    //查询商品分类列表
    @RequestMapping("/goods/findTypeList")
    @ResponseBody
    @Log("查询商品分类")
    public ServerResponse findTypeList(){
        List<GoodsType> typeList = goodsService.findGoodsTypeList();
        return ServerResponse.success(typeList);
    }

    //删除类别节点
    @RequestMapping("/goods/deleteGoodsType")
    @ResponseBody
    @Log(value="删除类别")
    public ServerResponse deleteGoodsType(@RequestParam("ids[]") List<Integer> ids){
        goodsService.deleteGoodsType(ids);
        return ServerResponse.success();
    }

    //修改商品类别
    @RequestMapping("/goods/updateType")
    @ResponseBody
    @Log(value="修改类别")
    public ServerResponse updateGoodsType(GoodsType goodsType){
        goodsService.updateGoodsType(goodsType);
        return ServerResponse.success();
    }

    //添加分类节点
    @RequestMapping("/goods/addType")
    @ResponseBody
    @Log(value="添加分类节点")
    public ServerResponse addGoodsType(GoodsType goodsType){

        goodsService.addGoodsType(goodsType);
        return ServerResponse.success(goodsType);

    }

    //查询商品类型树
    @RequestMapping("/goods/goodsType")
    @ResponseBody
    @Log(value="查询商品类型树")
    public ServerResponse findGoodsTypeList(){

        List<GoodsType> typeList = goodsService.findGoodsTypeList();
        List<Map> resultMapList = new ArrayList<Map>();
        for (GoodsType type : typeList) {
            Map item = new HashMap();
            item.put("id", type.getId());
            item.put("name", type.getName());
            item.put("pId", type.getFatherId());
            resultMapList.add(item);
        }
        return ServerResponse.success(resultMapList);
    }

    //根据id查询商品(回显)
    @RequestMapping("/goods/queryGoodsById")
    @ResponseBody
    @Log("根据id查询商品")
    public ServerResponse queryGoodsById(Goods goods){
         goods = goodsService.queryGoodsById(goods.getGoodsId());
        return ServerResponse.success(goods);
    }

    //查询品牌
    @RequestMapping("/goods/findBrand")
    @ResponseBody
    @Log("查询商品品牌")
    public ServerResponse findBrand(){
       List<Brand> brands = brandServive.findGoodsBrand();
       System.err.println(brands);
        return ServerResponse.success(brands);
    }

    @RequestMapping("/goods/list")
    @ResponseBody
    @Log("查询商品")
    public ServerResponse findGoodsList(Goods goods,int draw){

        if(null != goods){
            if(StringUtils.isNotBlank(goods.getGoodsName())){
                goods.setGoodsName("%"+goods.getGoodsName()+"%");
            }
        }

        Map resultMap = new HashMap();
        //查询分页总条数
        int count = goodsService.findGoodsCount(goods);
        System.err.println(count);
        //查询品牌
        List<Goods> goodsList = goodsService.findGoodsList(goods);
        System.err.println(goodsList);
        resultMap.put("draw", draw);
        resultMap.put("data", goodsList);
        resultMap.put("iTotalRecords", count);
        resultMap.put("iTotalDisplayRecords", count);
        return ServerResponse.success(resultMap);
    }

    //增加商品
    @RequestMapping("/goods/add")
    @ResponseBody
    @Log("增加商品")
    public ServerResponse addGoods(Goods goods){
        System.err.println(goods);
        goodsService.addGoods(goods);
        return ServerResponse.success(goods);
    }
    //上传图片
    @RequestMapping("/goods/flieinput")
    @ResponseBody
    public ServerResponse flieinput(@RequestParam("photo") CommonsMultipartFile photo, HttpServletRequest request ){
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

    //删除商品
    @RequestMapping("/goods/deleteBatch")
    @ResponseBody
    @Log("删除商品")
    public ServerResponse deleteGoods(@RequestParam("idList[]") List<Integer> ids){
        goodsService.deleteGoods(ids);
        return ServerResponse.success();
    }

}