package com.qfedu.fmmall.entity;

import javax.persistence.Column;
import javax.persistence.Id;
import java.util.ArrayList;
import java.util.List;

public class AreaVo {
    @Id
    @Column(name = "id")
    private Integer id;

    /**
     * 地区名称
     */
    @Column(name = "name")
    private String name;

    /**
     * 分类层级 分类得类型，
     1:一级大分类
     2:二级分类
     3:三级小分类
     */
    @Column(name = "level")
    private Integer level;

    /**
     * 父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级
     */
    @Column(name = "pid")
    private Integer pid;


    @Column(name = "displayorder")
    private Integer displayorder;


    @Column(name = "visible")
    private Integer visible;

    public List<AreaVo> areas = new ArrayList<>();

    @Override
    public String toString() {
        return "AreaVo{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", level=" + level +
                ", pid=" + pid +
                ", displayorder=" + displayorder +
                ", visible=" + visible +
                ", areas=" + areas +
                '}';
    }

    public List<AreaVo> getAreas() {
        return areas;
    }

    public void setVisible(Integer visible) {
        this.visible = visible;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public Integer getPid() {
        return pid;
    }

    public Integer getVisible() {
        return visible;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getLevel() {
        return level;
    }

    public void setDisplayorder(Integer displayorder) {
        this.displayorder = displayorder;
    }

    public Integer getDisplayorder() {
        return displayorder;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }


}
