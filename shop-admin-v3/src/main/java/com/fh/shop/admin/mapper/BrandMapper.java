package com.fh.shop.admin.mapper;

import com.fh.shop.admin.po.Brand;

import java.util.List;

public interface BrandMapper {
    public void addBrand(Brand brand);

    int findBrandCount(Brand brand);

    List<Brand> findBrandList(Brand brand);

    void deleteBrand(List<Integer> ids);

    Brand queryBrandById(Integer id);

    List<Brand> findGoodsBrand();
}
