package controller;

import java.util.ArrayList;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Section;
import service.SectionService;
import service.SequenceGenerator;

@Controller
@RequestMapping("/bbsSection/")
public class SectionController {

	@Autowired
	private SectionService sectionService;
	@Autowired
	public SequenceGenerator sequenceGenerator;

	// 查询所有版块信息
	@RequestMapping("querySection")
	@ResponseBody
	public String querySection() {

		ArrayList<Section> list = sectionService.querySection();
		JSONArray jsonArray = JSONArray.fromObject(list);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	// 按SectionId查询版块信息
	@RequestMapping("queryBySectionId")
	@ResponseBody
	public String queryBySectionId(Section section) {

		section = sectionService.queryBySectionId(section);
		System.out.println(section.getSectionName());
		JSONArray jsonArray = JSONArray.fromObject(section);
		System.out.println(jsonArray.toString());
		return jsonArray.toString();
	}
	
	// 按SectionName查询版块信息
		@RequestMapping("queryBySectionName")
		@ResponseBody
		public boolean queryBySectionName(Section section) {
			ArrayList<Section> list = sectionService.queryBySectionName(section);
			if (list.size() > 0) {
				return false;
			}
			return true;
		}

	// 添加版块信息
	@RequestMapping("addSection")
	@ResponseBody
	public boolean addSection(Section section) {
		try {
			section.setSectionId(sequenceGenerator.nextRechargeOrderSeq());
			if (sectionService.addSection(section)) {
				return true;
			} else {
				return false;
			}

		} catch (Exception e) {
			return false;
		}
	}

	// 修改版块信息
	@RequestMapping("updateSection")
	@ResponseBody
	public boolean updateSection(Section section) {
		try {

			if (sectionService.updateSection(section)) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}
	
	// 删除版块信息
	@RequestMapping("deleteSection")
	@ResponseBody
	public boolean deleteSection(Section section) {
		try {
			if (sectionService.deleteSection(section)) {
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

}
