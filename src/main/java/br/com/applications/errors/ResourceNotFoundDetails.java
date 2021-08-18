package br.com.applications.errors;



public class ResourceNotFoundDetails extends ErrorDetails {

    /**
     *
     */
    private static final long serialVersionUID = -5620884056498969879L;


    public static final class Builder {

        private String title;
        private int status;
        private String detail;
        private long timestamp;
        private String developerMessage;
        private String message;

        private Builder() {
        }

        public static Builder newBuilder() {
            return new Builder();
        }

        public Builder title(String title) {
            this.title = title;
            return this;
        }

        public Builder status(int status) {
            this.status = status;
            return this;
        }

        public Builder detail(String detail) {
            this.detail = detail;
            return this;
        }

        public Builder timestamp(long timestamp) {
            this.timestamp = timestamp;
            return this;
        }

        public Builder developerMessage(String developerMessage) {
            this.developerMessage = developerMessage;
            return this;
        }

        public Builder message(String message) {
            this.message = message;
            return this;
        }

        public ResourceNotFoundDetails build() {

            ResourceNotFoundDetails resourceNotFoundDetails = new ResourceNotFoundDetails();
            resourceNotFoundDetails.setDeveloperMessage(developerMessage);
            resourceNotFoundDetails.setTitle(title);
            resourceNotFoundDetails.setDetail(detail);
            resourceNotFoundDetails.setTimestamp(timestamp);
            resourceNotFoundDetails.setStatus(status);
            resourceNotFoundDetails.setMessage(message);
            return resourceNotFoundDetails;
        }
    }
}
