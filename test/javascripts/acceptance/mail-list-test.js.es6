import { acceptance } from "discourse/tests/helpers/qunit-helpers";

acceptance("MailList", { loggedIn: true });

test("MailList works", async assert => {
  await visit("/admin/plugins/mail-list");

  assert.ok(false, "it shows the MailList button");
});
