
export const paginationHelperMixin = {
    watch: {
        currentPage: async function(newPage, oldPage) {
            if(newPage > oldPage)
                this.offset = this.max * oldPage
            else if(newPage < oldPage)
                this.offset = this.max * (newPage -1)

            if (typeof this.loadPage === "function") { 
                await this.loadPage()
            } else {
                console.log("Please implement loadPage() function!")
            }
            
        },
    },
    methods: {
        onPageChange(page) {
            console.log(page)
            this.currentPage = page;
        },
  },
}
  