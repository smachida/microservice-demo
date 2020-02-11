package jp.vmware.sol.microservices.core.product.product.services;

import jp.vmware.sol.api.core.product.Product;
import jp.vmware.sol.api.core.product.ProductService;
import jp.vmware.sol.util.exceptions.InvalidInputException;
import jp.vmware.sol.util.exceptions.NotFoundException;
import jp.vmware.sol.util.http.ServiceUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ProductServiceImpl implements ProductService {
    private static final Logger LOG = LoggerFactory.getLogger(ProductServiceImpl.class);
    private final ServiceUtil serviceUtil;

    @Autowired
    public ProductServiceImpl(ServiceUtil serviceUtil) {
        this.serviceUtil = serviceUtil;
    }


    @Override
    public Product getProduct(int productId) {
        LOG.debug("/product return the found product for productId={}", productId);
        if (productId < 1)
            throw new InvalidInputException("Invalid productId: " + productId);
        if (productId == 13)
            throw new NotFoundException("No product found for productId: " + productId);

        return new Product(productId, "name-" + productId, 123,
                serviceUtil.getServiceAddress());
    }
}
