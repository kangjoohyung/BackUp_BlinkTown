package web.mvc.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import web.mvc.domain.Album;
import web.mvc.domain.Category;
import web.mvc.domain.Goods;
import web.mvc.domain.Product;
import web.mvc.service.ProductService;

@Controller
@RequestMapping("/shop")
@RequiredArgsConstructor
public class ProductController {

	private final ProductService service;
	private static final String MAIN_DIR = "/save/shopImg/title";
	private static final String DETAIL_DIR = "/save/shopImg/detail";
	

	private static final int PAGE_COUNT = 4;

	@RequestMapping("/insertAlbum")
	public String insertProduct(Album album, Category category, MultipartFile mainImg, MultipartFile detailImg,
			HttpSession session) {
		album.setCategory(category);

		String mainDir = session.getServletContext().getRealPath(MAIN_DIR);
		String mainFileName = mainImg.getOriginalFilename();

		String detailDir = session.getServletContext().getRealPath(DETAIL_DIR);
		String detailFileName = detailImg.getOriginalFilename();

		try {
			mainImg.transferTo(new File(mainDir + "/" + mainFileName));
			detailImg.transferTo(new File(detailDir + "/" + detailFileName));

			album.setProductMainImg(mainFileName);
			album.setProductDetailImg(detailFileName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		service.insertProduct(album);

		return "admin/main";
	}

	@RequestMapping("/insertGoods")
	public String insertProduct(Goods goods, Category category, MultipartFile mainImg, MultipartFile detailImg,
			HttpSession session) {
		goods.setCategory(category);

		String mainDir = session.getServletContext().getRealPath(MAIN_DIR);
		String mainFileName = mainImg.getOriginalFilename();

		String detailDir = session.getServletContext().getRealPath(DETAIL_DIR);
		String detailFileName = detailImg.getOriginalFilename();

		try {
			mainImg.transferTo(new File(mainDir + "/" + mainFileName));
			detailImg.transferTo(new File(detailDir + "/" + detailFileName));

			goods.setProductMainImg(mainFileName);
			goods.setProductDetailImg(detailFileName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		service.insertProduct(goods);

		return "admin/main";
	}

	@RequestMapping("/updateAlbum")
	public String updateAlbum(Album album) {
		service.updateProduct(album);
		return "admin/main";
	}

	@RequestMapping("/updateGoods")
	public String updateAlbum(Goods goods) {
		service.updateProduct(goods);
		return "admin/main";
	}

	@RequestMapping("/delete")
	public String deleteByProductCode(String productCode) {
		service.deleteByProductCode(productCode);
		return "admin/main";
	}

	@RequestMapping("/select")
	@ResponseBody
	public Page<Product> selectAllProduct(@RequestParam(required = false) String categoryCode, Integer GoodsMembershipOnly, String orderCondition, @RequestParam(defaultValue = "1") int nowPage) {
		Pageable pageable = PageRequest.of((nowPage -1), PAGE_COUNT);
		Page<Product> productList = service.selectAllProduct(pageable, categoryCode, GoodsMembershipOnly, orderCondition);
		return productList;
	};

	@RequestMapping("/select/{productCode}")
	public ModelAndView selectByProductCode(@PathVariable String productCode, Boolean flag) {
		System.out.println("productCode" + productCode);
		Product product = service.selectByProductCode(productCode, flag);
		return new ModelAndView("shop/details" + product.getCategory().getCategoryCode().toUpperCase(), "product",
				product);
	};

	@GetMapping("/{url}")
	public void url() {
	}

}
