package jp.vmware.sol.api.composite.product;

public class RecommendationSummary {
    private int recommendationId;
    private String author;
    private int rate;

    public RecommendationSummary(int recommendationId, String author, int rate) {
        this.recommendationId = recommendationId;
        this .author = author;
        this.rate = rate;
    }


    public int getRecommendationId() {
        return recommendationId;
    }

    public void setRecommendationId(int recommendationId) {
        this.recommendationId = recommendationId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public int getRate() {
        return rate;
    }

    public void setRate(int rate) {
        this.rate = rate;
    }
}
