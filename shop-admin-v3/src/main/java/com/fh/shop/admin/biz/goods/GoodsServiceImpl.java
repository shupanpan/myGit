package com.fh.shop.admin.biz.goods;

import com.fh.shop.admin.mapper.GoodsMapper;
import com.fh.shop.admin.po.Goods;
import com.fh.shop.admin.po.GoodsType;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("goodsService")
public class GoodsServiceImpl implements IGoodsService {

    @Resource
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> findGoodsList(Goods goods) {
        return goodsMapper.findGoodsList(goods);
    }

    @Override
    public int findGoodsCount(Goods goods) {
        return goodsMapper.findGoodsCount(goods);
    }

    @Override
    public void addGoods(Goods goods) {
        goodsMapper.addGoods(goods);
    }

    @Override
    public void deleteGoods(List<Integer> ids) {
        if(null != ids && ids.size() > 0){
            goodsMapper.deleteGoods(ids);
        }
    }

    @Override
    public Goods queryGoodsById(Integer goodsId) {
        return goodsMapper.queryGoodsById(goodsId);
    }

    @Override
    public List<GoodsType> findGoodsTypeList() {
        return goodsMapper.findGoodsTypeList();
    }

    @Override
    public void addGoodsType(GoodsType goodsType) {
        goodsMapper.addGoodsType(goodsType);
    }

    @Override
    public void updateGoodsType(GoodsType goodsType) {
        goodsMapper.updateGoodsType(goodsType);
    }

    @Override
    public void deleteGoodsType(List<Integer> ids) {
        goodsMapper.deleteGoodsType(ids);
    }
}
