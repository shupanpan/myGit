package com.fh.shop.admin.biz.goods;

import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.po.GoodsType;

import java.util.List;

public interface IGoodsService {

    public List<Goods> findGoodsList(Goods goods);

    //查询总条数
    int findGoodsCount(Goods goods);

    //添加
    void addGoods(Goods goods);

    //删除
    void deleteGoods(List<Integer> ids);

    Goods queryGoodsById(Integer goodsId);

    //查询商品类型
    List<GoodsType> findGoodsTypeList();
    //添加商品类型
    void addGoodsType(GoodsType goodsType);
    //修改商品类型
    void updateGoodsType(GoodsType goodsType);
    //删除商品类型
    void deleteGoodsType(List<Integer> ids);

}
