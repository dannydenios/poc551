/**
 *
 */
package de.hybris.merchandise.storefront.renderer;

import de.hybris.platform.acceleratorcms.component.renderer.CMSComponentRenderer;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.merchandisecore.model.contents.components.CMSProductPromoComponentModel;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;


/**
 * @author david
 */
public class CMSProductPromoComponentRenderer implements CMSComponentRenderer<CMSProductPromoComponentModel>
{

	@Override
	public void renderComponent(final PageContext pageContext, final CMSProductPromoComponentModel component)
			throws ServletException, IOException
	{
		try
		{
			final JspWriter out = pageContext.getOut();
			final ProductModel product = component.getProduct();

			out.write("<div>");
			out.write("<p>NOME PRODOTTO:</p>");
			out.write("<p>" + product.getName() + "</p>");
			out.write("</div>");

		}
		catch (final Exception ignore)
		{
			// ignore exception
		}
	}

}
