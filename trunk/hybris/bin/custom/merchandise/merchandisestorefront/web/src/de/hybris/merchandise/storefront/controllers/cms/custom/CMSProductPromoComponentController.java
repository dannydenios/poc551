/**
 *
 */
package de.hybris.merchandise.storefront.controllers.cms.custom;

import de.hybris.merchandise.storefront.controllers.ControllerConstants;
import de.hybris.merchandise.storefront.controllers.cms.AbstractCMSComponentController;
import de.hybris.platform.commercefacades.product.ProductFacade;
import de.hybris.platform.commercefacades.product.ProductOption;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.merchandisecore.model.contents.components.CMSProductPromoComponentModel;

import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * @author david
 *
 */
@Controller("CMSProductPromoComponentController")
@Scope("tenant")
@RequestMapping(value = ControllerConstants.Actions.Cms.CMSProductPromoComponent)
public class CMSProductPromoComponentController extends AbstractCMSComponentController<CMSProductPromoComponentModel>
{
	protected static final List<ProductOption> PRODUCT_OPTIONS = Arrays.asList(ProductOption.BASIC, ProductOption.PRICE);

	@Resource(name = "accProductFacade")
	private ProductFacade productFacade;

	@Override
	protected void fillModel(final HttpServletRequest request, final Model model, final CMSProductPromoComponentModel component)
	{
		final ProductData productData = productFacade.getProductForOptions(component.getProduct(), PRODUCT_OPTIONS);
		model.addAttribute("productData", productData);
	}

}
