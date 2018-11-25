package com.fh.shop.admin.biz.brand;

import com.fh.shop.admin.po.Brand;

import java.util.List;

public interface IBrandServive {

    //添加品牌
    public  void addBrand(Brand brand);

    //分页总条数
    int findBrandCount(Brand brand);
    //分页查询品牌列表
    List<Brand> findBrandList(Brand brand);

    //删除品牌
    void deleteBrand(List<Integer> ids);

    Brand queryBrandById(Integer id);

    List<Brand> findGoodsBrand();

    void addBrands(List<Brand> brands);
}
