package com.mapper;

import com.model.Yhbumen;
import com.model.Yhbumen;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface YhbumenMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_yhyhbumen
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer yhyhbumenId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_yhyhbumen
     *
     * @mbggenerated
     */
    int insert(Yhbumen record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_yhyhbumen
     *
     * @mbggenerated
     */
    Yhbumen selectByPrimaryKey(Integer yhyhbumenId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_yhyhbumen
     *
     * @mbggenerated
     */
    List<Yhbumen> selectAll(@Param("yhbumen")Yhbumen record,@Param("page")int page,@Param("rows")int rows);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table t_yhyhbumen
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(Yhbumen record);
}