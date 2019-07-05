package service;

import java.util.ArrayList;

import mapper.SectionMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Section;

@Service
public class SectionService {

	@Autowired
	private SectionMapper sectionMapper;

	// 查询所有版块信息
	public ArrayList<Section> querySection() {
		return sectionMapper.querySection();
	}
	
	// 按SectionId查询版块信息
	public Section queryBySectionId(Section section) {
		return sectionMapper.queryBySectionId(section);
	}
	
	// 按SectionId查询版块信息
	public ArrayList<Section> queryBySectionName(Section section) {
		return sectionMapper.queryBySectionName(section);
	}

	// 添加版块信息
	public boolean addSection(Section section) {
		return sectionMapper.addSection(section);
	}

	// 修改版块信息
	public boolean updateSection(Section section) {
		return sectionMapper.updateSection(section);
	}
	
	// 删除版块信息
	public boolean deleteSection(Section section) {
		return sectionMapper.deleteSection(section);
	}
}
