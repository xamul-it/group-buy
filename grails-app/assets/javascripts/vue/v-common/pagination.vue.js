//lodash
const { drop, every, forEach, get, isArray, map, set } = _;
//import { drop, every, forEach, get, isArray, map, set } from 'lodash';

var VPagination = Vue.component("VPagination", {
    name: "v-pagination",
    template: `<ul class="pagination mb-5">

      <li class="page-item page-prev" :class="{ disabled: isInFirstPage || disablePagination }">
        <a @click="onClickPreviousPage" tabindex="-1" class="page-link btn" ><</a>
      </li>

      <li v-for="page in pages" class="page-item" 
        :class="{ active: isPageActive(page.name), disabled: page.isDisabled || disablePagination }">
        <a @click="onClickPage(page.name)" class="btn page-link">{{ page.name }}</a>
      </li>

      <li class="page-item page-next" :class="{ disabled: isInLastPage || disablePagination }">
        <a @click="onClickPreviousPage" tabindex="-1" class="page-link btn">></a>
      </li>
    
    </ul>`,
  props: {
    maxVisibleButtons: {
      type: Number,
      required: false,
      default: 3
    },
    total: {
      type: Number,
      required: true
    },
    perPage: {
      type: Number,
      default: 10,
      required: true
    },
    currentPage: {
      type: Number,
      required: true
    },
    disablePagination: {
      type: Boolean,
      required: false,
      default: false
    }
  },
  computed: {
    paginationStart: function () {
        if (this.opts.chunksNavigation === 'scroll') {
            return this.firstPage;
        }

        return ((this.currentChunk - 1) * this.opts.chunk) + 1;
    },
    pagesInCurrentChunk: function () {
        return this.paginationStart + this.opts.chunk <= this.totalPages ?
            this.opts.chunk :
            this.totalPages - this.paginationStart + 1;

    },
    totalPages() {
        return this.total ? Math.ceil(this.total / this.perPage) : 1;
    },
    startPage() {
      let startPage = 1
      if (this.currentPage === 1) {
        return startPage;
      }

      if (this.currentPage === this.totalPages) { 
        startPage = this.totalPages - this.maxVisibleButtons +1
        if(startPage>0)
          return startPage
        else
          return 1
      }

      startPage = this.currentPage - 1;
      if(startPage>0)
        return startPage
      else
        return 1
    },
    endPage() {
      return Math.min(this.startPage + this.maxVisibleButtons - 1, this.totalPages);
    },
    pages() {
      const range = [];

      for (let i = this.startPage; i <= this.endPage; i+= 1 ) {
        range.push({
          name: i,
          isDisabled: i === this.currentPage 
        });
      }

      return range;
    },
    isInFirstPage() {
      return this.currentPage === 1;
    },
    isInLastPage() {
      return this.currentPage === this.totalPages;
    },
  },  
  methods: {
    onClickFirstPage() {
      this.$emit('pagechanged', 1);
    },
    onClickPreviousPage() {
      this.$emit('pagechanged', this.currentPage - 1);
    },
    onClickPage(page) {
      this.$emit('pagechanged', page);
    },
    onClickNextPage() {
      this.$emit('pagechanged', this.currentPage + 1);
    },
    onClickLastPage() {
      this.$emit('pagechanged', this.totalPages);    
    },
    isPageActive(page) {
      return this.currentPage === page;
    },
 },
  
});

export default VPagination;