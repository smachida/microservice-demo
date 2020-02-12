package jp.vmware.sol.api.composite.product;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiResponse;
import io.swagger.annotations.ApiResponses;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Api("製品情報のための REST API")
public interface ProductCompositeService {
    /**
     * 利用例: curl $HOST:$PORT/product-composite/1
     * @param productId
     * @return 製品情報。見つからない場合は null
     */
    @ApiOperation(
            value = "${api.product-composite.get-composite-product.description}",
            notes = "${api.product-composite.get-composite-product.notes}"
    )
    @ApiResponses(value = {
            @ApiResponse(code = 400, message = "Bad Request, 不正なフォーマット"),
            @ApiResponse(code = 404, message = "Not Found, 指定した id に対応する製品が見つかりません"),
            @ApiResponse(code = 422, message = "Unprocessable entity, 指定したパラメータで処理を継続できません")
    })
    @GetMapping(
            value = "/product-composite/{productId}",
            produces = "application/json"
    )
    ProductAggregate getProduct(@PathVariable int productId);
}
