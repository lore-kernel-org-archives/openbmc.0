Return-Path: <stewart@linux.vnet.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x1tkJ28wJzDqj1
 for <openbmc@lists.ozlabs.org>; Tue,  4 Jul 2017 16:04:23 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id
 v6464IqX049433
 for <openbmc@lists.ozlabs.org>; Tue, 4 Jul 2017 02:04:21 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2bfdbdvcgm-1
 (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
 for <openbmc@lists.ozlabs.org>; Tue, 04 Jul 2017 02:04:21 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <openbmc@lists.ozlabs.org> from <stewart@linux.vnet.ibm.com>;
 Tue, 4 Jul 2017 00:04:13 -0600
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 Tue, 4 Jul 2017 00:04:11 -0600
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 v6464Brm2621854; Mon, 3 Jul 2017 23:04:11 -0700
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 155BE136049;
 Tue,  4 Jul 2017 00:04:11 -0600 (MDT)
Received: from birb.localdomain (unknown [9.83.0.66])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with SMTP id C2B6E13603C;
 Tue,  4 Jul 2017 00:04:09 -0600 (MDT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id 536A04EC745; Tue,  4 Jul 2017 16:04:05 +1000 (AEST)
From: Stewart Smith <stewart@linux.vnet.ibm.com>
To: Cyril Bur <cyrilbur@gmail.com>, Michael Tritz <mtritz@us.ibm.com>,
 skiboot@lists.ozlabs.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v5] pflash option to retrieve PNOR partition flags
In-Reply-To: <1499044329.1700.5.camel@gmail.com>
References: <20170630182953.28853-1-mtritz@us.ibm.com>
 <1499044329.1700.5.camel@gmail.com>
Date: Tue, 04 Jul 2017 16:04:05 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 17070406-0020-0000-0000-00000C4BA009
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00007317; HX=3.00000241; KW=3.00000007;
 PH=3.00000004; SC=3.00000214; SDB=6.00882572; UDB=6.00440199; IPR=6.00662763; 
 BA=6.00005453; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000;
 ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00016070; XFM=3.00000015;
 UTC=2017-07-04 06:04:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 17070406-0021-0000-0000-00005D15A1D4
Message-Id: <87mv8krb56.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
 definitions=2017-07-04_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=7
 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.0.1-1703280000
 definitions=main-1707040103
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
X-List-Received-Date: Tue, 04 Jul 2017 06:04:24 -0000

Cyril Bur <cyrilbur@gmail.com> writes:
> On Fri, 2017-06-30 at 13:29 -0500, Michael Tritz wrote:
>> This commit extends pflash with an option to retrieve and print
>> information for a particular partition, including the content from
>> "pflash -i" and a verbose list of set miscellaneous flags. -i option
>> is also updated to print a short list of flags in addition to the
>> ECC flag, with one character per flag. A test of the new option is
>> included in libflash/test.
>> 
>> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
>> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
>> ---
>
> It is customary to put a little rundown of what changed between
> versions here. This makes review easier :)
>
> For example
> V5:
>   Added tests to make check
>   Fixed indenting
>
>>  external/pflash/pflash.c          | 134 ++++++++++++++++++++++++++++++++++----
>>  libflash/libffs.c                 |  19 +++---
>>  libflash/libffs.h                 |   8 ++-
>>  libflash/test/Makefile.check      |   5 +-
>>  libflash/test/test-miscprint.pnor | 103 +++++++++++++++++++++++++++++
>>  libflash/test/test-miscprint.sh   |  27 ++++++++
>>  6 files changed, 275 insertions(+), 21 deletions(-)
>>  create mode 100644 libflash/test/test-miscprint.pnor
>>  create mode 100644 libflash/test/test-miscprint.sh
>> 
>> diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
>> index a344987e..9d57feea 100644
>> --- a/external/pflash/pflash.c
>> +++ b/external/pflash/pflash.c
>> @@ -14,6 +14,8 @@
>>   * limitations under the License.
>>   */
>>  
>> +#define _GNU_SOURCE
>> +
>>  #include <stdio.h>
>>  #include <stdlib.h>
>>  #include <string.h>
>> @@ -90,6 +92,7 @@ static void print_ffs_info(uint32_t toc_offset)
>>  {
>>  	struct ffs_handle *ffs_handle;
>>  	uint32_t other_side_offset = 0;
>> +	struct ffs_entry *ent;
>>  	int rc;
>>  	uint32_t i;
>>  
>> @@ -103,25 +106,40 @@ static void print_ffs_info(uint32_t toc_offset)
>>  		return;
>>  	}
>>  
>> -	for (i = 0;; i++) {
>> +	for (i = 0; rc == 0; i++) {
>>  		uint32_t start, size, act, end;
>> -		bool ecc;
>> -		char *name;
>> +		char *name = NULL, *flags;
>> +		int l;
>>  
>> -		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, &ecc);
>> +		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, NULL);
>>  		if (rc == FFS_ERR_PART_NOT_FOUND)
>>  			break;
>> -		if (rc) {
>> -			fprintf(stderr, "Error %d scanning partitions\n", rc);
>> -			break;
>> +
>> +		ent = ffs_entry_get(ffs_handle, i);
>> +		if (rc || !ent) {
>> +			fprintf(stderr, "Error %d scanning partitions\n",
>> +					!ent ? FFS_ERR_PART_NOT_FOUND : rc);
>> +		    goto out;
>>  		}
>> +
>> +		l = asprintf(&flags, "[%c%c%c%c%c]",
>> +				has_ecc(ent) ? 'E' : '-',
>> +				has_flag(ent, FFS_MISCFLAGS_PRESERVED) ? 'P' : '-',
>> +				has_flag(ent, FFS_MISCFLAGS_READONLY) ? 'R' : '-',
>> +				has_flag(ent, FFS_MISCFLAGS_BACKUP) ? 'B' : '-',
>> +				has_flag(ent, FFS_MISCFLAGS_REPROVISION) ? 'F' : '-');
>> +		if (l < 0)
>> +			goto out;
>> +
>>  		end = start + size;
>>  		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
>> -		       i, name, start, end, act, ecc ? "[ECC]" : "");
>> +				i, name, start, end, act, flags);
>>  
>>  		if (strcmp(name, "OTHER_SIDE") == 0)
>>  			other_side_offset = start;
>>  
>> +		free(flags);
>> +out:
>>  		free(name);
>>  	}
>>  
>> @@ -413,6 +431,81 @@ static void disable_4B_addresses(void)
>>  	}
>>  }
>>  
>> +static void print_partition_detail(uint32_t toc_offset, uint32_t part_id, char *name)
>> +{
>> +	uint32_t start, size, act, end;
>> +	struct ffs_handle *ffs_handle;
>> +	char *ent_name = NULL, *flags;
>> +	struct ffs_entry *ent;
>> +	int rc, l;
>> +
>> +	rc = ffs_init(toc_offset, fl_total_size, bl, &ffs_handle, 0);
>> +	if (rc) {
>> +		fprintf(stderr, "Error %d opening ffs !\n", rc);
>> +		return;
>> +	}
>> +
>> +	if (name) {
>> +		uint32_t i;
>> +
>> +		for (i = 0;;i++) {
>> +			rc = ffs_part_info(ffs_handle, i, &ent_name, &start, &size, &act,
>> +            		NULL);
>> +			if (rc == FFS_ERR_PART_NOT_FOUND) {
>> +				fprintf(stderr, "Partition with name %s doesn't exist within TOC at 0x%08x\n", name, toc_offset);
>> +				goto out;
>> +			}
>> +			if (rc || strncmp(ent_name, name, FFS_PART_NAME_MAX) == 0) {
>> +				part_id = i;
>> +				break;
>> +			}
>> +			free(ent_name);
>> +			ent_name = NULL;
>> +		}
>> +	} else {
>> +		rc = ffs_part_info(ffs_handle, part_id, &ent_name, &start, &size, &act,
>> +				NULL);
>> +		if (rc == FFS_ERR_PART_NOT_FOUND) {
>> +			fprintf(stderr, "Partition with ID %d doesn't exist within TOC at 0x%08x\n",
>> +			part_id, toc_offset);
>> +			goto out;
>> +		}
>> +	}
>> +	ent = ffs_entry_get(ffs_handle, part_id);
>> +	if (rc || !ent) {
>> +		fprintf(stderr, "Error %d scanning partitions\n", !ent ?
>> +				FFS_ERR_PART_NOT_FOUND : rc);
>> +		goto out;
>> +	}
>> +
>> +	printf("Detailed partition information\n");
>> +	end = start + size;
>> +	printf("Name:\n");
>> +	printf("%s (ID=%02d)\n\n", ent_name, part_id);
>> +	printf("%-10s  %-10s  %-10s\n", "Start", "End", "Actual");
>> +	printf("0x%08x  0x%08x  0x%08x\n\n", start, end, act);
>> +
>> +	printf("Flags:\n");
>> +
>> +	l = asprintf(&flags, "%s%s%s%s%s", has_ecc(ent) ? "ECC [E]\n" : "",
>> +			has_flag(ent, FFS_MISCFLAGS_PRESERVED) ? "PRESERVED [P]\n" : "",
>> +			has_flag(ent, FFS_MISCFLAGS_READONLY) ? "READONLY [R]\n" : "",
>> +			has_flag(ent, FFS_MISCFLAGS_BACKUP) ? "BACKUP [B]\n" : "",
>> +			has_flag(ent, FFS_MISCFLAGS_REPROVISION) ?
>> +					"REPROVISION [F]\n" : "");
>> +	if (l < 0) {
>> +		fprintf(stderr, "Memory allocation failure printing flags!\n");
>> +		goto out;
>> +	}
>> +
>> +	printf("%s", flags);
>> +	free(flags);
>> +
>> +out:
>> +	ffs_close(ffs_handle);
>> +	free(ent_name);
>> +}
>> +
>>  static void print_version(void)
>>  {
>>  	printf("Open-Power Flash tool %s\n", version);
>> @@ -494,6 +587,10 @@ static void print_help(const char *pname)
>>  	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
>>  	printf("\t-i, --info\n");
>>  	printf("\t\tDisplay some information about the flash.\n\n");
>> +	printf("\t--detail\n");
>> +	printf("\t\tDisplays detailed info about a particular partition.\n");
>> +	printf("\t\tAccepts a numeric partition or can be used in conjuction\n");
>> +	printf("\t\twith the -P flag.\n\n");
>>  	printf("\t-h, --help\n");
>>  	printf("\t\tThis message.\n\n");
>>  }
>> @@ -508,7 +605,7 @@ void exiting(void)
>>  int main(int argc, char *argv[])
>>  {
>>  	const char *pname = argv[0];
>> -	uint32_t address = 0, read_size = 0, write_size = 0;
>> +	uint32_t address = 0, read_size = 0, write_size = 0, detail_id = UINT_MAX;
>>  	uint32_t erase_start = 0, erase_size = 0;
>>  	bool erase = false, do_clear = false;
>>  	bool program = false, erase_all = false, info = false, do_read = false;
>> @@ -516,7 +613,7 @@ int main(int argc, char *argv[])
>>  	bool show_help = false, show_version = false;
>>  	bool no_action = false, tune = false;
>>  	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
>> -	bool ffs_toc_seen = false, direct = false;
>> +	bool ffs_toc_seen = false, direct = false, print_detail = false;
>>  	int rc;
>>  
>>  	while(1) {
>> @@ -535,6 +632,7 @@ int main(int argc, char *argv[])
>>  			{"force",	no_argument,		NULL,	'f'},
>>  			{"flash-file",	required_argument,	NULL,	'F'},
>>  			{"info",	no_argument,		NULL,	'i'},
>> +			{"detail",  optional_argument,  NULL,   'm'},
>>  			{"tune",	no_argument,		NULL,	't'},
>>  			{"dummy",	no_argument,		NULL,	'd'},
>>  			{"help",	no_argument,		NULL,	'h'},
>> @@ -622,6 +720,11 @@ int main(int argc, char *argv[])
>>  		case 'c':
>>  			do_clear = true;
>>  			break;
>> +		case 'm':
>> +			print_detail = true;
>> +			if (optarg)
>> +				detail_id = strtoul(optarg, NULL, 0);
>> +			break;
>>  		case ':':
>>  			fprintf(stderr, "Unrecognised option \"%s\" to '%c'\n", optarg, optopt);
>>  			no_action = true;
>> @@ -651,7 +754,7 @@ int main(int argc, char *argv[])
>>  	 * also tune them as a side effect
>>  	 */
>>  	no_action = no_action || (!erase && !program && !info && !do_read &&
>> -		!enable_4B && !disable_4B && !tune && !do_clear);
>> +		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
>>  
>>  	/* Nothing to do, if we didn't already, print usage */
>>  	if (no_action && !show_version)
>> @@ -684,6 +787,12 @@ int main(int argc, char *argv[])
>>  		exit(1);
>>  	}
>>  
>> +	if (print_detail && ((detail_id == UINT_MAX && !part_name)
>> +			|| (detail_id != UINT_MAX && part_name))) {
>> +		fprintf(stderr, "--detail requires either a partition id or\n");
>> +		fprintf(stderr, "a partition name with -P\n");
>> +	}
>> +
>>  	/* part-name and erase-all make no sense together */
>>  	if (part_name && erase_all) {
>>  		fprintf(stderr, "--partition and --erase-all are mutually"
>> @@ -872,6 +981,9 @@ int main(int argc, char *argv[])
>>  		print_flash_info(flash_side ? 0 : ffs_toc);
>>  	}
>>  
>> +	if (print_detail)
>> +		print_partition_detail(flash_side ? 0 : ffs_toc, detail_id, part_name);
>> +
>>  	/* Unlock flash (PNOR only) */
>>  	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
>>  		need_relock = arch_flash_set_wrprotect(bl, false);
>> diff --git a/libflash/libffs.c b/libflash/libffs.c
>> index 763e061c..5acfe837 100644
>> --- a/libflash/libffs.c
>> +++ b/libflash/libffs.c
>> @@ -180,7 +180,15 @@ static int ffs_entry_to_cpu(struct ffs_hdr *hdr,
>>  	return rc;
>>  }
>>  
>> -static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>> +bool has_flag(struct ffs_entry *ent, uint16_t flag)
>> +{
>> +	if (flag == FFS_ENRY_INTEG_ECC) {
>> +		return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
>> +	}
>> +	return ((ent->user.miscflags & flag) != 0);
>> +}
>> +
>> +struct ffs_entry *ffs_entry_get(struct ffs_handle *ffs, uint32_t index)
>>  {
>>  	int i = 0;
>>  	struct ffs_entry *ent = NULL;
>> @@ -193,11 +201,6 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>>  	return NULL;
>>  }
>>  
>> -bool has_ecc(struct ffs_entry *ent)
>> -{
>> -	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
>> -}
>> -
>>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
>>  		struct ffs_handle **ffs, bool mark_ecc)
>>  {
>> @@ -369,7 +372,7 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>>  	struct ffs_entry *ent;
>>  	char *n;
>>  
>> -	ent = ffs_get_part(ffs, part_idx);
>> +	ent = ffs_entry_get(ffs, part_idx);
>>  	if (!ent)
>>  		return FFS_ERR_PART_NOT_FOUND;
>>  
>> @@ -776,7 +779,7 @@ int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>>  	uint32_t offset;
>>  	int rc;
>>  
>> -	ent = ffs_get_part(ffs, part_idx);
>> +	ent = ffs_entry_get(ffs, part_idx);
>>  	if (!ent) {
>>  		FL_DBG("FFS: Entry not found\n");
>>  		return FFS_ERR_PART_NOT_FOUND;
>> diff --git a/libflash/libffs.h b/libflash/libffs.h
>> index 2c1fbd83..aaa062ae 100644
>> --- a/libflash/libffs.h
>> +++ b/libflash/libffs.h
>> @@ -89,8 +89,12 @@ struct ffs_entry_user {
>>  #define FFS_MISCFLAGS_BACKUP 0x20
>>  #define FFS_MISCFLAGS_REPROVISION 0x10
>>  
>> +bool has_flag(struct ffs_entry *ent, uint16_t flag);
>>  
>> -bool has_ecc(struct ffs_entry *ent);
>> +static inline bool has_ecc(struct ffs_entry *ent)
>> +{
>> +	return has_flag(ent, FFS_ENRY_INTEG_ECC);
>> +}
>>  
>
> So I got to thinking, after being happy with this - wouldn't this break
> binaries dynamically linked? This would actually make the symbol go
> away and interesting things will happen to binaries which expect to
> find a real has_ecc(). We might actually have to leave has_ecc() and
> inside the .c just call has_flag.
>
>
> Joel got quite angry last time I broke libflash/libffs.

Alternative is to bump the soname, which is also valid. Existing binaries will
pick up old libflash.

-- 
Stewart Smith
OPAL Architect, IBM.
