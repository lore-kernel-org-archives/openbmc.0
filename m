Return-Path: <mtritz@us.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wpfQF2xNTzDq7c
 for <openbmc@lists.ozlabs.org>; Fri, 16 Jun 2017 09:11:33 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v5FN8cGA115932
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 19:11:31 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2b3ujwcyaf-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Thu, 15 Jun 2017 19:11:30 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <mtritz@us.ibm.com>;
 Thu, 15 Jun 2017 19:11:29 -0400
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Thu, 15 Jun 2017 19:11:26 -0400
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v5FNBQ7b56688724; Thu, 15 Jun 2017 23:11:26 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E880A124037;
 Thu, 15 Jun 2017 19:08:58 -0400 (EDT)
Received: from localhost.localdomain (unknown [9.80.236.247])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP id 4CD62124035;
 Thu, 15 Jun 2017 19:08:58 -0400 (EDT)
From: Michael Tritz <mtritz@us.ibm.com>
To: skiboot@lists.ozlabs.org, openbmc@lists.ozlabs.org
Cc: Michael Tritz <mtritz@us.ibm.com>, cyrilbur@gmail.com
Subject: [PATCH v3] pflash option to retrieve PNOR partition flags
Date: Thu, 15 Jun 2017 18:10:20 -0500
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
X-TM-AS-GCONF: 00
x-cbid: 17061523-0048-0000-0000-000001A85582
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007239; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000212; SDB=6.00875336; UDB=6.00435810; IPR=6.00655424; 
 BA=6.00005423; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00015842; XFM=3.00000015;
 UTC=2017-06-15 23:11:27
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17061523-0049-0000-0000-00004188A925
Message-Id: <20170615231020.56263-1-mtritz@us.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-06-15_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1706150400
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
X-List-Received-Date: Thu, 15 Jun 2017 23:11:33 -0000

This commit extends pflash with an option to retrieve and print
information for a particular partition, including the content from
"pflash -i" and a verbose list of set miscellaneous flags. -i option
is also updated to print a short list of flags in addition to the
ECC flag, with one character per flag. A test of the new option is
included in libflash/test.

Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
---
 external/pflash/pflash.c          |  86 ++++++++++++++++++++++++++++---
 libflash/libffs.c                 |  26 +++++++++-
 libflash/libffs.h                 |   5 ++
 libflash/test/test-miscprint.pnor | 103 ++++++++++++++++++++++++++++++++++++++
 libflash/test/test-miscprint.sh   |  40 +++++++++++++++
 5 files changed, 252 insertions(+), 8 deletions(-)
 create mode 100644 libflash/test/test-miscprint.pnor
 create mode 100644 libflash/test/test-miscprint.sh

diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
index a344987e..74c0adf8 100644
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
@@ -89,6 +91,7 @@ static void check_confirm(void)
 static void print_ffs_info(uint32_t toc_offset)
 {
 	struct ffs_handle *ffs_handle;
+	struct ffs_entry_user ent_user;
 	uint32_t other_side_offset = 0;
 	int rc;
 	uint32_t i;
@@ -115,9 +118,21 @@ static void print_ffs_info(uint32_t toc_offset)
 			fprintf(stderr, "Error %d scanning partitions\n", rc);
 			break;
 		}
+
+		ent_user = ffs_entry_user_get(ffs_get_part(ffs_handle, i));
+
+		char *flags;
+		int l;
+		l = asprintf(&flags, "[%c%c%c%c%c]",
+					(ecc) ? 'E' : '-',
+					has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED) ? 'P' : '-',
+					has_flag(&ent_user, FFS_MISCFLAGS_READONLY) ? 'R' : '-',
+					has_flag(&ent_user, FFS_MISCFLAGS_BACKUP) ? 'B' : '-',
+					has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION) ? 'F' : '-');
+
 		end = start + size;
 		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
-		       i, name, start, end, act, ecc ? "[ECC]" : "");
+		       i, name, start, end, act, (l != -1) ? flags : NULL);
 
 		if (strcmp(name, "OTHER_SIDE") == 0)
 			other_side_offset = start;
@@ -413,6 +428,56 @@ static void disable_4B_addresses(void)
 	}
 }
 
+static void print_partition_detail(uint32_t part_ID)
+{
+	struct ffs_handle *ffs_handle;
+	struct ffs_entry_user ent_user;
+	int rc;
+	uint32_t start, size, act, end;
+	bool ecc;
+	char *name;
+
+	rc = ffs_init(0, fl_total_size, bl, &ffs_handle, 0);
+	if (rc) {
+		fprintf(stderr, "Error %d opening ffs !\n", rc);
+		return;
+	}
+
+	rc = ffs_part_info(ffs_handle, part_ID, &name, &start, &size, &act, &ecc);
+	if (rc == FFS_ERR_PART_NOT_FOUND)
+		return;
+	if (rc) {
+		fprintf(stderr, "Error %d scanning partitions\n", rc);
+		return;
+	}
+
+	ent_user = ffs_entry_user_get(ffs_get_part(ffs_handle, part_ID));
+
+	ffs_close(ffs_handle);
+
+	end = start + size;
+	printf("ID=%02d - %s %08x..%08x (actual=%08x)\n",
+		   part_ID, name, start, end, act);
+
+	char *flags;
+	int l;
+	l = asprintf(&flags, "%s%s%s%s%s",
+				(ecc) ? "ECC," : "",
+				has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED) ?
+						"PRESERVED," : "",
+				has_flag(&ent_user, FFS_MISCFLAGS_READONLY) ? "READONLY," : "",
+				has_flag(&ent_user, FFS_MISCFLAGS_BACKUP) ? "BACKUP," : "",
+				has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION) ?
+						"REPROVISION." : "");
+	if (l > 0)
+	{
+		flags[l-1] = '\n';
+		printf(flags);
+	}
+
+	return;
+}
+
 static void print_version(void)
 {
 	printf("Open-Power Flash tool %s\n", version);
@@ -494,6 +559,9 @@ static void print_help(const char *pname)
 	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
 	printf("\t-i, --info\n");
 	printf("\t\tDisplay some information about the flash.\n\n");
+	printf("\t-m --misc\n");
+	printf("\t\tDisplays miscellaneous info about a particular partition.\n");
+	printf("\t\tRequires the numerical partition index as an argument.\n\n");
 	printf("\t-h, --help\n");
 	printf("\t\tThis message.\n\n");
 }
@@ -508,7 +576,7 @@ void exiting(void)
 int main(int argc, char *argv[])
 {
 	const char *pname = argv[0];
-	uint32_t address = 0, read_size = 0, write_size = 0;
+	uint32_t address = 0, read_size = 0, write_size = 0, part_ID = 0;
 	uint32_t erase_start = 0, erase_size = 0;
 	bool erase = false, do_clear = false;
 	bool program = false, erase_all = false, info = false, do_read = false;
@@ -516,7 +584,7 @@ int main(int argc, char *argv[])
 	bool show_help = false, show_version = false;
 	bool no_action = false, tune = false;
 	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
-	bool ffs_toc_seen = false, direct = false;
+	bool ffs_toc_seen = false, direct = false, print_detail = false;
 	int rc;
 
 	while(1) {
@@ -534,7 +602,7 @@ int main(int argc, char *argv[])
 			{"program",	required_argument,	NULL,	'p'},
 			{"force",	no_argument,		NULL,	'f'},
 			{"flash-file",	required_argument,	NULL,	'F'},
-			{"info",	no_argument,		NULL,	'i'},
+			{"info",	no_argument,  		NULL,	'i'},
 			{"tune",	no_argument,		NULL,	't'},
 			{"dummy",	no_argument,		NULL,	'd'},
 			{"help",	no_argument,		NULL,	'h'},
@@ -547,7 +615,7 @@ int main(int argc, char *argv[])
 		};
 		int c, oidx = 0;
 
-		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:",
+		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:m:",
 				long_opts, &oidx);
 		if (c == -1)
 			break;
@@ -622,6 +690,10 @@ int main(int argc, char *argv[])
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
@@ -651,7 +723,7 @@ int main(int argc, char *argv[])
 	 * also tune them as a side effect
 	 */
 	no_action = no_action || (!erase && !program && !info && !do_read &&
-		!enable_4B && !disable_4B && !tune && !do_clear);
+		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
 
 	/* Nothing to do, if we didn't already, print usage */
 	if (no_action && !show_version)
@@ -871,6 +943,8 @@ int main(int argc, char *argv[])
 		 */
 		print_flash_info(flash_side ? 0 : ffs_toc);
 	}
+	if (print_detail)
+		print_partition_detail(part_ID);
 
 	/* Unlock flash (PNOR only) */
 	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
diff --git a/libflash/libffs.c b/libflash/libffs.c
index 763e061c..1a9ce82a 100644
--- a/libflash/libffs.c
+++ b/libflash/libffs.c
@@ -180,7 +180,7 @@ static int ffs_entry_to_cpu(struct ffs_hdr *hdr,
 	return rc;
 }
 
-static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
+struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
 {
 	int i = 0;
 	struct ffs_entry *ent = NULL;
@@ -195,7 +195,16 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
 
 bool has_ecc(struct ffs_entry *ent)
 {
-	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
+	struct ffs_entry_user entry_user = ffs_entry_user_get(ent);
+	return has_flag(&entry_user, FFS_ENRY_INTEG_ECC);
+}
+
+bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG)
+{
+	if (FLAG == FFS_ENRY_INTEG_ECC) {
+		return ((ent_user->datainteg & FFS_ENRY_INTEG_ECC) != 0);
+	}
+	return ((ent_user->miscflags & FLAG) != 0);
 }
 
 int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
@@ -546,6 +555,19 @@ int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int sid
 	return rc;
 }
 
+struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry)
+{
+	struct ffs_entry_user entry_user;
+
+	entry_user.chip = entry->user.chip;
+	entry_user.compresstype = entry->user.compresstype;
+	entry_user.datainteg = entry->user.datainteg;
+	entry_user.vercheck = entry->user.vercheck;
+	entry_user.miscflags = entry->user.miscflags;
+
+	return entry_user;
+}
+
 /* This should be done last! */
 int ffs_hdr_create_backup(struct ffs_hdr *hdr)
 {
diff --git a/libflash/libffs.h b/libflash/libffs.h
index 2c1fbd83..72ae4a1c 100644
--- a/libflash/libffs.h
+++ b/libflash/libffs.h
@@ -89,9 +89,12 @@ struct ffs_entry_user {
 #define FFS_MISCFLAGS_BACKUP 0x20
 #define FFS_MISCFLAGS_REPROVISION 0x10
 
+struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index);
 
 bool has_ecc(struct ffs_entry *ent);
 
+bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG);
+
 /* Init */
 
 int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
@@ -140,6 +143,8 @@ int ffs_entry_user_set(struct ffs_entry *ent, struct ffs_entry_user *user);
 
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
index 00000000..7670b6e4
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
+pass=false
+wd=$(dirname -- "$0")
+
+xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
+
+output=$(pflash -m 1 -F "$wd/temp.pnor" | grep ,)
+if [[ $output == "PRESERVED" ]]; then
+    pass=true
+fi
+
+output=$(pflash -m 2 -F "$wd/temp.pnor" | grep ,)
+if [[ $output == "READONLY" ]]; then
+    pass=true
+fi
+
+output=$(pflash -m 3 -F "$wd/temp.pnor" | grep ,)
+if [[ $output == "REPROVISION" ]]; then
+    pass=true
+fi
+
+output=$(pflash -m 4 -F "$wd/temp.pnor" | grep ,)
+if [[ $output == "BACKUP" ]]; then
+    pass=true
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
