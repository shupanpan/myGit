package com.fh.shop.admin.mapper;

import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.po.GoodsType;

import java.util.List;

public interface GoodsMapper {
    public List<Goods> findGoodsList(Goods goods);

    //查询总条数
    int findGoodsCount(Goods goods);

    //添加
    void addGoods(Goods goods);

    //删除
    void deleteGoods(List<Integer> ids);

    Goods queryGoodsById(Integer goodsId);

    //查询商品类型分类树
    List<GoodsType> findGoodsTypeList();
    //新增商品类型分类树
    void addGoodsType(GoodsType goodsType);
    //修改商品类型分类树
    void updateGoodsType(GoodsType goodsType);
    //删除节点
    void deleteGoodsType(List<Integer> ids);
}
