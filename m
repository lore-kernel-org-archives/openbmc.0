Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qV3jR3n4qzDq6X
 for <openbmc@lists.ozlabs.org>; Wed, 23 Mar 2016 07:10:51 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1458677445788856.3021541244761;
 Tue, 22 Mar 2016 13:10:45 -0700 (PDT)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH openbmc 3/4] Add upstream jffs2 fixes to our 4.3 kernel
Date: Tue, 22 Mar 2016 15:10:38 -0500
Message-Id: <1458677439-17628-4-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
References: <1458677439-17628-1-git-send-email-openbmc-patches@stwcx.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Zoho-Virus-Status: 1
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.20
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Mar 2016 20:10:52 -0000

From: "Milton D. Miller II" <miltonm@us.ibm.com>

Include some fixes for jffs2 marked for stable in our 4.3 branch.

Signed-off-by: Milton Miller <miltonm@us.ibm.com>
---
 ...ectory-hardlinks-from-deleted-directories.patch | 195 +++++++++++++++++++++
 ...2-Fix-lock-acquisition-order-bug-in-jffs2.patch | 134 ++++++++++++++
 .../0002-jffs2-Fix-page-lock-f-sem-deadlock.patch  |  75 ++++++++
 .../recipes-kernel/linux/linux-obmc_%.bbappend     |   5 +
 4 files changed, 409 insertions(+)
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Fix-directory-hardlinks-from-deleted-directories.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch
 create mode 100644 meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0002-jffs2-Fix-page-lock-f-sem-deadlock.patch

diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Fix-directory-hardlinks-from-deleted-directories.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Fix-directory-hardlinks-from-deleted-directories.patch
new file mode 100644
index 0000000..8ea8ce1
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Fix-directory-hardlinks-from-deleted-directories.patch
@@ -0,0 +1,195 @@
+From be629c62a603e5935f8177fd8a19e014100a259e Mon Sep 17 00:00:00 2001
+From: David Woodhouse <David.Woodhouse@intel.com>
+Date: Mon, 1 Feb 2016 14:04:46 +0000
+Subject: [PATCH 1/1] Fix directory hardlinks from deleted directories
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+When a directory is deleted, we don't take too much care about killing off
+all the dirents that belong to it — on the basis that on remount, the scan
+will conclude that the directory is dead anyway.
+
+This doesn't work though, when the deleted directory contained a child
+directory which was moved *out*. In the early stages of the fs build
+we can then end up with an apparent hard link, with the child directory
+appearing both in its true location, and as a child of the original
+directory which are this stage of the mount process we don't *yet* know
+is defunct.
+
+To resolve this, take out the early special-casing of the "directories
+shall not have hard links" rule in jffs2_build_inode_pass1(), and let the
+normal nlink processing happen for directories as well as other inodes.
+
+Then later in the build process we can set ic->pino_nlink to the parent
+inode#, as is required for directories during normal operaton, instead
+of the nlink. And complain only *then* about hard links which are still
+in evidence even after killing off all the unreachable paths.
+
+Reported-by: Liu Song <liu.song11@zte.com.cn>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Cc: stable@vger.kernel.org
+---
+ fs/jffs2/build.c    | 75 ++++++++++++++++++++++++++++++++++++++++-------------
+ fs/jffs2/nodelist.h |  6 ++++-
+ 2 files changed, 62 insertions(+), 19 deletions(-)
+
+diff --git a/fs/jffs2/build.c b/fs/jffs2/build.c
+index 0ae91ad..b288c8a 100644
+--- a/fs/jffs2/build.c
++++ b/fs/jffs2/build.c
+@@ -50,7 +50,8 @@ next_inode(int *i, struct jffs2_inode_cache *ic, struct jffs2_sb_info *c)
+ 
+ 
+ static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
+-				    struct jffs2_inode_cache *ic)
++				    struct jffs2_inode_cache *ic,
++				    int *dir_hardlinks)
+ {
+ 	struct jffs2_full_dirent *fd;
+ 
+@@ -69,19 +70,21 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
+ 			dbg_fsbuild("child \"%s\" (ino #%u) of dir ino #%u doesn't exist!\n",
+ 				  fd->name, fd->ino, ic->ino);
+ 			jffs2_mark_node_obsolete(c, fd->raw);
++			/* Clear the ic/raw union so it doesn't cause problems later. */
++			fd->ic = NULL;
+ 			continue;
+ 		}
+ 
++		/* From this point, fd->raw is no longer used so we can set fd->ic */
++		fd->ic = child_ic;
++		child_ic->pino_nlink++;
++		/* If we appear (at this stage) to have hard-linked directories,
++		 * set a flag to trigger a scan later */
+ 		if (fd->type == DT_DIR) {
+-			if (child_ic->pino_nlink) {
+-				JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u appears to be a hard link\n",
+-					    fd->name, fd->ino, ic->ino);
+-				/* TODO: What do we do about it? */
+-			} else {
+-				child_ic->pino_nlink = ic->ino;
+-			}
+-		} else
+-			child_ic->pino_nlink++;
++			child_ic->flags |= INO_FLAGS_IS_DIR;
++			if (child_ic->pino_nlink > 1)
++				*dir_hardlinks = 1;
++		}
+ 
+ 		dbg_fsbuild("increased nlink for child \"%s\" (ino #%u)\n", fd->name, fd->ino);
+ 		/* Can't free scan_dents so far. We might need them in pass 2 */
+@@ -95,8 +98,7 @@ static void jffs2_build_inode_pass1(struct jffs2_sb_info *c,
+ */
+ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
+ {
+-	int ret;
+-	int i;
++	int ret, i, dir_hardlinks = 0;
+ 	struct jffs2_inode_cache *ic;
+ 	struct jffs2_full_dirent *fd;
+ 	struct jffs2_full_dirent *dead_fds = NULL;
+@@ -120,7 +122,7 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
+ 	/* Now scan the directory tree, increasing nlink according to every dirent found. */
+ 	for_each_inode(i, c, ic) {
+ 		if (ic->scan_dents) {
+-			jffs2_build_inode_pass1(c, ic);
++			jffs2_build_inode_pass1(c, ic, &dir_hardlinks);
+ 			cond_resched();
+ 		}
+ 	}
+@@ -156,6 +158,20 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
+ 	}
+ 
+ 	dbg_fsbuild("pass 2a complete\n");
++
++	if (dir_hardlinks) {
++		/* If we detected directory hardlinks earlier, *hopefully*
++		 * they are gone now because some of the links were from
++		 * dead directories which still had some old dirents lying
++		 * around and not yet garbage-collected, but which have
++		 * been discarded above. So clear the pino_nlink field
++		 * in each directory, so that the final scan below can
++		 * print appropriate warnings. */
++		for_each_inode(i, c, ic) {
++			if (ic->flags & INO_FLAGS_IS_DIR)
++				ic->pino_nlink = 0;
++		}
++	}
+ 	dbg_fsbuild("freeing temporary data structures\n");
+ 
+ 	/* Finally, we can scan again and free the dirent structs */
+@@ -163,6 +179,33 @@ static int jffs2_build_filesystem(struct jffs2_sb_info *c)
+ 		while(ic->scan_dents) {
+ 			fd = ic->scan_dents;
+ 			ic->scan_dents = fd->next;
++			/* We do use the pino_nlink field to count nlink of
++			 * directories during fs build, so set it to the
++			 * parent ino# now. Now that there's hopefully only
++			 * one. */
++			if (fd->type == DT_DIR) {
++				if (!fd->ic) {
++					/* We'll have complained about it and marked the coresponding
++					   raw node obsolete already. Just skip it. */
++					continue;
++				}
++
++				/* We *have* to have set this in jffs2_build_inode_pass1() */
++				BUG_ON(!(fd->ic->flags & INO_FLAGS_IS_DIR));
++
++				/* We clear ic->pino_nlink ∀ directories' ic *only* if dir_hardlinks
++				 * is set. Otherwise, we know this should never trigger anyway, so
++				 * we don't do the check. And ic->pino_nlink still contains the nlink
++				 * value (which is 1). */
++				if (dir_hardlinks && fd->ic->pino_nlink) {
++					JFFS2_ERROR("child dir \"%s\" (ino #%u) of dir ino #%u is also hard linked from dir ino #%u\n",
++						    fd->name, fd->ino, ic->ino, fd->ic->pino_nlink);
++					/* Should we unlink it from its previous parent? */
++				}
++
++				/* For directories, ic->pino_nlink holds that parent inode # */
++				fd->ic->pino_nlink = ic->ino;
++			}
+ 			jffs2_free_full_dirent(fd);
+ 		}
+ 		ic->scan_dents = NULL;
+@@ -241,11 +284,7 @@ static void jffs2_build_remove_unlinked_inode(struct jffs2_sb_info *c,
+ 
+ 			/* Reduce nlink of the child. If it's now zero, stick it on the
+ 			   dead_fds list to be cleaned up later. Else just free the fd */
+-
+-			if (fd->type == DT_DIR)
+-				child_ic->pino_nlink = 0;
+-			else
+-				child_ic->pino_nlink--;
++			child_ic->pino_nlink--;
+ 
+ 			if (!child_ic->pino_nlink) {
+ 				dbg_fsbuild("inode #%u (\"%s\") now has no links; adding to dead_fds list.\n",
+diff --git a/fs/jffs2/nodelist.h b/fs/jffs2/nodelist.h
+index fa35ff7..0637271 100644
+--- a/fs/jffs2/nodelist.h
++++ b/fs/jffs2/nodelist.h
+@@ -194,6 +194,7 @@ struct jffs2_inode_cache {
+ #define INO_STATE_CLEARING	6	/* In clear_inode() */
+ 
+ #define INO_FLAGS_XATTR_CHECKED	0x01	/* has no duplicate xattr_ref */
++#define INO_FLAGS_IS_DIR	0x02	/* is a directory */
+ 
+ #define RAWNODE_CLASS_INODE_CACHE	0
+ #define RAWNODE_CLASS_XATTR_DATUM	1
+@@ -249,7 +250,10 @@ struct jffs2_readinode_info
+ 
+ struct jffs2_full_dirent
+ {
+-	struct jffs2_raw_node_ref *raw;
++	union {
++		struct jffs2_raw_node_ref *raw;
++		struct jffs2_inode_cache *ic; /* Just during part of build */
++	};
+ 	struct jffs2_full_dirent *next;
+ 	uint32_t version;
+ 	uint32_t ino; /* == zero for unlink */
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch
new file mode 100644
index 0000000..a532d0b
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch
@@ -0,0 +1,134 @@
+From 157078f64b8a9cd7011b6b900b2f2498df850748 Mon Sep 17 00:00:00 2001
+From: Thomas Betker <thomas.betker@rohde-schwarz.com>
+Date: Tue, 10 Nov 2015 22:18:15 +0100
+Subject: [PATCH 1/2] Revert "jffs2: Fix lock acquisition order bug in
+ jffs2_write_begin"
+
+This reverts commit 5ffd3412ae55
+("jffs2: Fix lock acquisition order bug in jffs2_write_begin").
+
+The commit modified jffs2_write_begin() to remove a deadlock with
+jffs2_garbage_collect_live(), but this introduced new deadlocks found
+by multiple users. page_lock() actually has to be called before
+mutex_lock(&c->alloc_sem) or mutex_lock(&f->sem) because
+jffs2_write_end() and jffs2_readpage() are called with the page locked,
+and they acquire c->alloc_sem and f->sem, resp.
+
+In other words, the lock order in jffs2_write_begin() was correct, and
+it is the jffs2_garbage_collect_live() path that has to be changed.
+
+Revert the commit to get rid of the new deadlocks, and to clear the way
+for a better fix of the original deadlock.
+
+Reported-by: Deng Chao <deng.chao1@zte.com.cn>
+Reported-by: Ming Liu <liu.ming50@gmail.com>
+Reported-by: wangzaiwei <wangzaiwei@top-vision.cn>
+Signed-off-by: Thomas Betker <thomas.betker@rohde-schwarz.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Cc: stable@vger.kernel.org
+---
+ fs/jffs2/file.c | 39 ++++++++++++++++++---------------------
+ 1 file changed, 18 insertions(+), 21 deletions(-)
+
+diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
+index c5ac594..cad86ba 100644
+--- a/fs/jffs2/file.c
++++ b/fs/jffs2/file.c
+@@ -137,39 +137,33 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
+ 	struct page *pg;
+ 	struct inode *inode = mapping->host;
+ 	struct jffs2_inode_info *f = JFFS2_INODE_INFO(inode);
+-	struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
+-	struct jffs2_raw_inode ri;
+-	uint32_t alloc_len = 0;
+ 	pgoff_t index = pos >> PAGE_CACHE_SHIFT;
+ 	uint32_t pageofs = index << PAGE_CACHE_SHIFT;
+ 	int ret = 0;
+ 
+-	jffs2_dbg(1, "%s()\n", __func__);
+-
+-	if (pageofs > inode->i_size) {
+-		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
+-					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
+-		if (ret)
+-			return ret;
+-	}
+-
+-	mutex_lock(&f->sem);
+ 	pg = grab_cache_page_write_begin(mapping, index, flags);
+-	if (!pg) {
+-		if (alloc_len)
+-			jffs2_complete_reservation(c);
+-		mutex_unlock(&f->sem);
++	if (!pg)
+ 		return -ENOMEM;
+-	}
+ 	*pagep = pg;
+ 
+-	if (alloc_len) {
++	jffs2_dbg(1, "%s()\n", __func__);
++
++	if (pageofs > inode->i_size) {
+ 		/* Make new hole frag from old EOF to new page */
++		struct jffs2_sb_info *c = JFFS2_SB_INFO(inode->i_sb);
++		struct jffs2_raw_inode ri;
+ 		struct jffs2_full_dnode *fn;
++		uint32_t alloc_len;
+ 
+ 		jffs2_dbg(1, "Writing new hole frag 0x%x-0x%x between current EOF and new page\n",
+ 			  (unsigned int)inode->i_size, pageofs);
+ 
++		ret = jffs2_reserve_space(c, sizeof(ri), &alloc_len,
++					  ALLOC_NORMAL, JFFS2_SUMMARY_INODE_SIZE);
++		if (ret)
++			goto out_page;
++
++		mutex_lock(&f->sem);
+ 		memset(&ri, 0, sizeof(ri));
+ 
+ 		ri.magic = cpu_to_je16(JFFS2_MAGIC_BITMASK);
+@@ -196,6 +190,7 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
+ 		if (IS_ERR(fn)) {
+ 			ret = PTR_ERR(fn);
+ 			jffs2_complete_reservation(c);
++			mutex_unlock(&f->sem);
+ 			goto out_page;
+ 		}
+ 		ret = jffs2_add_full_dnode_to_inode(c, f, fn);
+@@ -210,10 +205,12 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
+ 			jffs2_mark_node_obsolete(c, fn->raw);
+ 			jffs2_free_full_dnode(fn);
+ 			jffs2_complete_reservation(c);
++			mutex_unlock(&f->sem);
+ 			goto out_page;
+ 		}
+ 		jffs2_complete_reservation(c);
+ 		inode->i_size = pageofs;
++		mutex_unlock(&f->sem);
+ 	}
+ 
+ 	/*
+@@ -222,18 +219,18 @@ static int jffs2_write_begin(struct file *filp, struct address_space *mapping,
+ 	 * case of a short-copy.
+ 	 */
+ 	if (!PageUptodate(pg)) {
++		mutex_lock(&f->sem);
+ 		ret = jffs2_do_readpage_nolock(inode, pg);
++		mutex_unlock(&f->sem);
+ 		if (ret)
+ 			goto out_page;
+ 	}
+-	mutex_unlock(&f->sem);
+ 	jffs2_dbg(1, "end write_begin(). pg->flags %lx\n", pg->flags);
+ 	return ret;
+ 
+ out_page:
+ 	unlock_page(pg);
+ 	page_cache_release(pg);
+-	mutex_unlock(&f->sem);
+ 	return ret;
+ }
+ 
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0002-jffs2-Fix-page-lock-f-sem-deadlock.patch b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0002-jffs2-Fix-page-lock-f-sem-deadlock.patch
new file mode 100644
index 0000000..474d942
--- /dev/null
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc/0002-jffs2-Fix-page-lock-f-sem-deadlock.patch
@@ -0,0 +1,75 @@
+From 49e91e7079febe59a20ca885a87dd1c54240d0f1 Mon Sep 17 00:00:00 2001
+From: David Woodhouse <David.Woodhouse@intel.com>
+Date: Mon, 1 Feb 2016 12:37:20 +0000
+Subject: [PATCH 2/2] jffs2: Fix page lock / f->sem deadlock
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+With this fix, all code paths should now be obtaining the page lock before
+f->sem.
+
+Reported-by: Szabó Tamás <sztomi89@gmail.com>
+Tested-by: Thomas Betker <thomas.betker@rohde-schwarz.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Cc: stable@vger.kernel.org
+---
+ fs/jffs2/README.Locking |  5 +----
+ fs/jffs2/gc.c           | 17 ++++++++++-------
+ 2 files changed, 11 insertions(+), 11 deletions(-)
+
+diff --git a/fs/jffs2/README.Locking b/fs/jffs2/README.Locking
+index 3ea3655..8918ac9 100644
+--- a/fs/jffs2/README.Locking
++++ b/fs/jffs2/README.Locking
+@@ -2,10 +2,6 @@
+ 	JFFS2 LOCKING DOCUMENTATION
+ 	---------------------------
+ 
+-At least theoretically, JFFS2 does not require the Big Kernel Lock
+-(BKL), which was always helpfully obtained for it by Linux 2.4 VFS
+-code. It has its own locking, as described below.
+-
+ This document attempts to describe the existing locking rules for
+ JFFS2. It is not expected to remain perfectly up to date, but ought to
+ be fairly close.
+@@ -69,6 +65,7 @@ Ordering constraints:
+ 	   any f->sem held.
+ 	2. Never attempt to lock two file mutexes in one thread.
+ 	   No ordering rules have been made for doing so.
++	3. Never lock a page cache page with f->sem held.
+ 
+ 
+ 	erase_completion_lock spinlock
+diff --git a/fs/jffs2/gc.c b/fs/jffs2/gc.c
+index 5a2dec2..95d5880 100644
+--- a/fs/jffs2/gc.c
++++ b/fs/jffs2/gc.c
+@@ -1296,14 +1296,17 @@ static int jffs2_garbage_collect_dnode(struct jffs2_sb_info *c, struct jffs2_era
+ 		BUG_ON(start > orig_start);
+ 	}
+ 
+-	/* First, use readpage() to read the appropriate page into the page cache */
+-	/* Q: What happens if we actually try to GC the _same_ page for which commit_write()
+-	 *    triggered garbage collection in the first place?
+-	 * A: I _think_ it's OK. read_cache_page shouldn't deadlock, we'll write out the
+-	 *    page OK. We'll actually write it out again in commit_write, which is a little
+-	 *    suboptimal, but at least we're correct.
+-	 */
++	/* The rules state that we must obtain the page lock *before* f->sem, so
++	 * drop f->sem temporarily. Since we also hold c->alloc_sem, nothing's
++	 * actually going to *change* so we're safe; we only allow reading.
++	 *
++	 * It is important to note that jffs2_write_begin() will ensure that its
++	 * page is marked Uptodate before allocating space. That means that if we
++	 * end up here trying to GC the *same* page that jffs2_write_begin() is
++	 * trying to write out, read_cache_page() will not deadlock. */
++	mutex_unlock(&f->sem);
+ 	pg_ptr = jffs2_gc_fetch_page(c, f, start, &pg);
++	mutex_lock(&f->sem);
+ 
+ 	if (IS_ERR(pg_ptr)) {
+ 		pr_warn("read_cache_page() returned error: %ld\n",
+-- 
+1.8.2.2
+
diff --git a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
index bb6f06c..4ca3407 100644
--- a/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
+++ b/meta-openbmc-bsp/meta-aspeed/meta-ast2400/recipes-kernel/linux/linux-obmc_%.bbappend
@@ -1,2 +1,7 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 SRC_URI += "file://defconfig file://hwmon.cfg"
+SRC_URI += " \
+ file://0001-Fix-directory-hardlinks-from-deleted-directories.patch \
+ file://0001-Revert-jffs2-Fix-lock-acquisition-order-bug-in-jffs2.patch \
+ file://0002-jffs2-Fix-page-lock-f-sem-deadlock.patch \
+ "
-- 
2.7.1
