export default function() {
  this.route("mail-list", function() {
    this.route("actions", function() {
      this.route("show", { path: "/:id" });
    });
  });
};
