package com.fh.shop.admin.biz.brand;

import com.fh.shop.admin.mapper.BrandMapper;
import com.fh.shop.admin.po.Brand;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("brandService")
public class BrandServiceImpl implements IBrandServive {

    @Resource
    private BrandMapper brandMapper;

    @Override
    public void addBrand(Brand brand) {
        brandMapper.addBrand(brand);

    }

    @Override
    public int findBrandCount(Brand brand) {
        return brandMapper.findBrandCount(brand);
    }

    @Override
    public List<Brand> findBrandList(Brand brand) {
        return brandMapper.findBrandList(brand);
    }

    @Override
    public void deleteBrand(List<Integer> ids) {
        if(null != ids && ids.size() > 0){
            brandMapper.deleteBrand(ids);
        }
    }

    @Override
    public Brand queryBrandById(Integer id) {
        return brandMapper.queryBrandById(id);
    }

    @Override
    public List<Brand> findGoodsBrand() {
        return brandMapper.findGoodsBrand();
    }

    @Override
    public void addBrands(List<Brand> brands) {
        for(Brand brand : brands){
            brandMapper.addBrand(brand);
        }
    }


}
