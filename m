Return-Path: <mtritz@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wktLN5WtHzDqLJ
 for <openbmc@lists.ozlabs.org>; Sat, 10 Jun 2017 05:55:08 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v59Js0cj140532
 for <openbmc@lists.ozlabs.org>; Fri, 9 Jun 2017 15:55:06 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ays2mj5mg-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Fri, 09 Jun 2017 15:55:06 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mtritz@us.ibm.com>;
 Fri, 9 Jun 2017 13:55:05 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Fri, 9 Jun 2017 13:55:02 -0600
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v59Jt2U216777294; Fri, 9 Jun 2017 12:55:02 -0700
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ECF266A03B;
 Fri,  9 Jun 2017 13:55:01 -0600 (MDT)
Received: from localhost.localdomain (unknown [9.85.195.93])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP id 439ED6A043;
 Fri,  9 Jun 2017 13:55:01 -0600 (MDT)
From: Michael Tritz <mtritz@us.ibm.com>
To: skiboot@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: Michael Tritz <mtritz@us.ibm.com>
Subject: Re: [PATCH] pflash option to retrieve PNOR partition flags
Date: Fri,  9 Jun 2017 14:54:55 -0500
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
X-TM-AS-GCONF: 00
x-cbid: 17060919-0012-0000-0000-0000146CF579
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007202; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00872441; UDB=6.00434076; IPR=6.00652510; 
 BA=6.00005406; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015764; XFM=3.00000015;
 UTC=2017-06-09 19:55:04
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17060919-0013-0000-0000-00004E0F5B74
Message-Id: <20170609195455.22309-1-mtritz@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-09_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706090346
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Jun 2017 19:55:09 -0000

This commit extends pflash with an option to retrieve and print
information for a particular partition, including the content from
"pflash -i" and a verbose list of set miscellaneous flags. -i option
is also updated to print a short list of flags in addition to the
ECC flag, with one character per flag. A test of the new option is
included in libflash/test.

Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
---
 external/pflash/pflash.c          |  88 ++++++++++++++++++++++++++++----
 libflash/libffs.c                 |  41 ++++++++++++---
 libflash/libffs.h                 |  16 +++++-
 libflash/test/test-miscprint.pnor | 103 ++++++++++++++++++++++++++++++++++++++
 libflash/test/test-miscprint.sh   |  40 +++++++++++++++
 5 files changed, 269 insertions(+), 19 deletions(-)
 create mode 100644 libflash/test/test-miscprint.pnor
 create mode 100644 libflash/test/test-miscprint.sh

diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
index a344987e..230351f3 100644
--- a/external/pflash/pflash.c
+++ b/external/pflash/pflash.c
@@ -14,6 +14,8 @@
  * limitations under the License.
  */
 
+#define _GNU_SOURCE
+
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
@@ -105,19 +107,29 @@ static void print_ffs_info(uint32_t toc_offset)
 
 	for (i = 0;; i++) {
 		uint32_t start, size, act, end;
-		bool ecc;
+		struct ffs_flags part_flags;
 		char *name;
 
-		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, &ecc);
+		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act,
+				&part_flags);
 		if (rc == FFS_ERR_PART_NOT_FOUND)
 			break;
 		if (rc) {
 			fprintf(stderr, "Error %d scanning partitions\n", rc);
 			break;
 		}
+
+		char *flags;
+		asprintf(&flags, "[%c%c%c%c%c]",
+		        (part_flags.ecc) ? 'E' : '-',
+		        (part_flags.preserved) ? 'P' : '-',
+		        (part_flags.readonly) ? 'R' : '-',
+		        (part_flags.backup) ? 'B' : '-',
+		        (part_flags.reprovision) ? 'F' : '-');
+
 		end = start + size;
 		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
-		       i, name, start, end, act, ecc ? "[ECC]" : "");
+		       i, name, start, end, act, flags);
 
 		if (strcmp(name, "OTHER_SIDE") == 0)
 			other_side_offset = start;
@@ -413,6 +425,51 @@ static void disable_4B_addresses(void)
 	}
 }
 
+static void print_partition_detail(uint32_t part_ID)
+{
+	struct ffs_handle *ffs_handle;
+	struct ffs_flags part_flags;
+	int rc;
+	uint32_t start, size, act, end;
+	char *name;
+
+	rc = ffs_init(0, fl_total_size, bl, &ffs_handle, 0);
+	if (rc) {
+		fprintf(stderr, "Error %d opening ffs !\n", rc);
+		return;
+	}
+
+	rc = ffs_part_info(ffs_handle, part_ID, &name, &start, &size, &act,
+			&part_flags);
+	if (rc == FFS_ERR_PART_NOT_FOUND)
+		return;
+	if (rc) {
+		fprintf(stderr, "Error %d scanning partitions\n", rc);
+		return;
+	}
+
+	ffs_close(ffs_handle);
+
+	end = start + size;
+	printf("ID=%02d - %s %08x..%08x (actual=%08x)\n",
+		   part_ID, name, start, end, act);
+
+	char buf [strlen("ECC,PRESERVED,READONLY,BACKUP,REPROVISION.")];
+	int l;
+	l = snprintf(buf, sizeof(buf), "%s%s%s%s%s",
+	        (part_flags.ecc) ? "ECC," : "",
+	        (part_flags.preserved) ? "PRESERVED," : "",
+	        (part_flags.readonly) ? "READONLY," : "",
+	        (part_flags.backup) ? "BACKUP," : "",
+	        (part_flags.reprovision) ? "REPROVISION." : "");
+	if (l)
+	    buf[l-1] = '\n';
+
+	printf(buf);
+
+	return;
+}
+
 static void print_version(void)
 {
 	printf("Open-Power Flash tool %s\n", version);
@@ -494,6 +551,9 @@ static void print_help(const char *pname)
 	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
 	printf("\t-i, --info\n");
 	printf("\t\tDisplay some information about the flash.\n\n");
+	printf("\t-m --misc\n");
+	printf("\t\tDisplays miscellaneous info about a particular partition.\n");
+	printf("\t\tRequires the numerical partition index as an argument.\n\n");
 	printf("\t-h, --help\n");
 	printf("\t\tThis message.\n\n");
 }
@@ -508,7 +568,7 @@ void exiting(void)
 int main(int argc, char *argv[])
 {
 	const char *pname = argv[0];
-	uint32_t address = 0, read_size = 0, write_size = 0;
+	uint32_t address = 0, read_size = 0, write_size = 0, part_ID = 0;
 	uint32_t erase_start = 0, erase_size = 0;
 	bool erase = false, do_clear = false;
 	bool program = false, erase_all = false, info = false, do_read = false;
@@ -516,7 +576,7 @@ int main(int argc, char *argv[])
 	bool show_help = false, show_version = false;
 	bool no_action = false, tune = false;
 	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
-	bool ffs_toc_seen = false, direct = false;
+	bool ffs_toc_seen = false, direct = false, print_detail = false;
 	int rc;
 
 	while(1) {
@@ -534,7 +594,7 @@ int main(int argc, char *argv[])
 			{"program",	required_argument,	NULL,	'p'},
 			{"force",	no_argument,		NULL,	'f'},
 			{"flash-file",	required_argument,	NULL,	'F'},
-			{"info",	no_argument,		NULL,	'i'},
+			{"info",	no_argument,  		NULL,	'i'},
 			{"tune",	no_argument,		NULL,	't'},
 			{"dummy",	no_argument,		NULL,	'd'},
 			{"help",	no_argument,		NULL,	'h'},
@@ -547,7 +607,7 @@ int main(int argc, char *argv[])
 		};
 		int c, oidx = 0;
 
-		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:",
+		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:m:",
 				long_opts, &oidx);
 		if (c == -1)
 			break;
@@ -622,6 +682,10 @@ int main(int argc, char *argv[])
 		case 'c':
 			do_clear = true;
 			break;
+		case 'm':
+			print_detail = true;
+			part_ID = strtoul(optarg, NULL, 10);
+			break;
 		case ':':
 			fprintf(stderr, "Unrecognised option \"%s\" to '%c'\n", optarg, optopt);
 			no_action = true;
@@ -651,7 +715,7 @@ int main(int argc, char *argv[])
 	 * also tune them as a side effect
 	 */
 	no_action = no_action || (!erase && !program && !info && !do_read &&
-		!enable_4B && !disable_4B && !tune && !do_clear);
+		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
 
 	/* Nothing to do, if we didn't already, print usage */
 	if (no_action && !show_version)
@@ -790,17 +854,17 @@ int main(int argc, char *argv[])
 	/* We have a partition, adjust read/write size if needed */
 	if (ffsh && ffs_index >= 0) {
 		uint32_t pstart, pmaxsz, pactsize;
-		bool ecc;
+		struct ffs_flags part_flags;
 		int rc;
 
 		rc = ffs_part_info(ffsh, ffs_index, NULL,
-				   &pstart, &pmaxsz, &pactsize, &ecc);
+				   &pstart, &pmaxsz, &pactsize, &part_flags);
 		if (rc) {
 			fprintf(stderr,"Failed to get partition info\n");
 			exit(1);
 		}
 
-		if (!ecc && do_clear) {
+		if (!part_flags.ecc && do_clear) {
 			fprintf(stderr, "The partition on which to do --clear "
 					"does not have ECC, are you sure?\n");
 			check_confirm();
@@ -871,6 +935,8 @@ int main(int argc, char *argv[])
 		 */
 		print_flash_info(flash_side ? 0 : ffs_toc);
 	}
+	if (print_detail)
+		print_partition_detail(part_ID);
 
 	/* Unlock flash (PNOR only) */
 	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
diff --git a/libflash/libffs.c b/libflash/libffs.c
index 763e061c..a3592521 100644
--- a/libflash/libffs.c
+++ b/libflash/libffs.c
@@ -193,9 +193,12 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
 	return NULL;
 }
 
-bool has_ecc(struct ffs_entry *ent)
+bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG)
 {
-	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
+    if (FLAG == FFS_ENRY_INTEG_ECC) {
+        return ((ent_user->datainteg & FFS_ENRY_INTEG_ECC) != 0);
+    }
+    return ((ent_user->miscflags & FLAG) != 0);
 }
 
 int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
@@ -311,7 +314,9 @@ int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
 		if (rc)
 			goto out;
 
-		if (mark_ecc && has_ecc(ent)) {
+		struct ffs_entry_user ent_user = ffs_entry_user_get(ent);
+
+		if (mark_ecc && has_flag(&ent_user, FFS_ENRY_INTEG_ECC)) {
 			rc = blocklevel_ecc_protect(bl, ent->base, ent->size);
 			if (rc) {
 				FL_ERR("Failed to blocklevel_ecc_protect(0x%08x, 0x%08x)\n",
@@ -364,9 +369,11 @@ int ffs_lookup_part(struct ffs_handle *ffs, const char *name,
 
 int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
 		  char **name, uint32_t *start,
-		  uint32_t *total_size, uint32_t *act_size, bool *ecc)
+		  uint32_t *total_size, uint32_t *act_size,
+		  struct ffs_flags *part_flags)
 {
 	struct ffs_entry *ent;
+	struct ffs_entry_user ent_user;
 	char *n;
 
 	ent = ffs_get_part(ffs, part_idx);
@@ -379,8 +386,17 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
 		*total_size = ent->size;
 	if (act_size)
 		*act_size = ent->actual;
-	if (ecc)
-		*ecc = has_ecc(ent);
+
+	if (part_flags)
+	{
+        ent_user = ffs_entry_user_get(ent);
+        part_flags->ecc = has_flag(&ent_user, FFS_ENRY_INTEG_ECC);
+        part_flags->preserved = has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED);
+        part_flags->readonly = has_flag(&ent_user, FFS_MISCFLAGS_READONLY);
+        part_flags->backup = has_flag(&ent_user, FFS_MISCFLAGS_BACKUP);
+        part_flags->reprovision =
+                has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION);
+	}
 
 	if (name) {
 		n = calloc(1, FFS_PART_NAME_MAX + 1);
@@ -546,6 +562,19 @@ int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int sid
 	return rc;
 }
 
+struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry)
+{
+    struct ffs_entry_user entry_user;
+
+    entry_user.chip = entry->user.chip;
+    entry_user.compresstype = entry->user.compresstype;
+    entry_user.datainteg = entry->user.datainteg;
+    entry_user.vercheck = entry->user.vercheck;
+    entry_user.miscflags = entry->user.miscflags;
+
+    return entry_user;
+}
+
 /* This should be done last! */
 int ffs_hdr_create_backup(struct ffs_hdr *hdr)
 {
diff --git a/libflash/libffs.h b/libflash/libffs.h
index 2c1fbd83..d5c6a486 100644
--- a/libflash/libffs.h
+++ b/libflash/libffs.h
@@ -24,6 +24,7 @@ struct ffs_handle;
 struct ffs_hdr;
 struct ffs_entry;
 struct ffs_entry_user;
+struct ffs_flags;
 
 /**
  * struct ffs_entry_user - User data entries
@@ -44,6 +45,14 @@ struct ffs_entry_user {
 	uint8_t miscflags;
 };
 
+struct ffs_flags {
+	bool ecc;
+	bool preserved;
+	bool readonly;
+	bool backup;
+	bool reprovision;
+};
+
 /* Error codes:
  *
  * < 0 = flash controller errors
@@ -90,7 +99,7 @@ struct ffs_entry_user {
 #define FFS_MISCFLAGS_REPROVISION 0x10
 
 
-bool has_ecc(struct ffs_entry *ent);
+bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG);
 
 /* Init */
 
@@ -124,7 +133,8 @@ int ffs_lookup_part(struct ffs_handle *ffs, const char *name,
 
 int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
 		  char **name, uint32_t *start,
-		  uint32_t *total_size, uint32_t *act_size, bool *ecc);
+		  uint32_t *total_size, uint32_t *act_size,
+		  struct ffs_flags *part_flags);
 
 int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
 			uint32_t act_size);
@@ -140,6 +150,8 @@ int ffs_entry_user_set(struct ffs_entry *ent, struct ffs_entry_user *user);
 
 int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int side);
 
+struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry);
+
 int ffs_hdr_create_backup(struct ffs_hdr *hdr);
 
 int ffs_hdr_finalise(struct blocklevel_device *bl, struct ffs_hdr *hdr);
diff --git a/libflash/test/test-miscprint.pnor b/libflash/test/test-miscprint.pnor
new file mode 100644
index 00000000..e3f3d355
--- /dev/null
+++ b/libflash/test/test-miscprint.pnor
@@ -0,0 +1,103 @@
+504152540000000100000001000000800000000500000300000000040000
+0000000000000000000000000000504151d5706172740000000000000000
+000000000000000000000001ffffffff0000000100000003000000010000
+030000000000000000000000000000000000000000000000000000000000
+000000000000000000000000000000000000000000000000000000000000
+000000000000000000000000000000000000000000008f9e8e8950524553
+4552564544000000000000000000000100000000ffffffff000000020000
+000100000000000001000000000000000000000000000000000000000000
+008000000000000000000000000000000000000000000000000000000000
+000000000000000000000000000000000000000000000000000000000000
+ae7fedeb524541444f4e4c5900000000000000000000000100000000ffff
+ffff00000003000000010000000000000100000000000000000000000000
+000000000000000000400000000000000000000000000000000000000000
+000000000000000000000000000000000000000000000000000000000000
+0000000000000000e2b4f3e1524550524f564953494f4e00000000000000
+000100000000ffffffff0000000400000001000000000000010000000000
+000000000000000000000000000000000010000000000000000000000000
+000000000000000000000000000000000000000000000000000000000000
+00000000000000000000000000000000abb3a9fa4241434b555000000000
+0000000000000000000200000000ffffffff000000050000000100000000
+000001000000000000000000000000000000000000000000002000000000
+000000000000000000000000000000000000000000000000000000000000
+000000000000000000000000000000000000000000000000e8cebdb2ffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
+ffffffffffffffffffffffff
diff --git a/libflash/test/test-miscprint.sh b/libflash/test/test-miscprint.sh
new file mode 100644
index 00000000..f4b6eb0a
--- /dev/null
+++ b/libflash/test/test-miscprint.sh
@@ -0,0 +1,40 @@
+#!/bin/bash
+
+# test-miscprint.pnor is constructed as follows:
+# PRESERVED,0x00000300,0x00000100,P,/dev/zero
+# READONLY,0x00000400,0x00000100,R,/dev/zero
+# REPROVISION,0x00000500,0x00000100,F,/dev/zero
+# BACKUP,0x00000600,0x00000100,B,/dev/zero
+
+pass=true
+wd=$(dirname -- "$0")
+
+xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
+
+output=$(pflash -m 1 -F "$wd/temp.pnor")
+if [[ $output != "PRESERVED" ]]; then
+    pass=false
+fi
+
+output=$(pflash -m 2 -F "$wd/temp.pnor")
+if [[ $output != "READONLY" ]]; then
+    pass=false
+fi
+
+output=$(pflash -m 3 -F "$wd/temp.pnor")
+if [[ $output != "REPROVISION" ]]; then
+    pass=false
+fi
+
+output=$(pflash -m 4 -F "$wd/temp.pnor")
+if [[ $output != "BACKUP" ]]; then
+    pass=false
+fi
+
+if [[ pass ]]; then
+    echo "Test passed!"
+else
+    echo "Test failed!"
+fi
+
+rm "$wd/temp.pnor"
-- 
2.11.0 (Apple Git-81)
