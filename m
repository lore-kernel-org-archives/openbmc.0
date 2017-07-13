Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x241.google.com (mail-pg0-x241.google.com
 [IPv6:2607:f8b0:400e:c05::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x7JPq2jWVzDqjx;
 Thu, 13 Jul 2017 11:38:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VnKzh+Gi"; 
 dkim-atps=neutral
Received: by mail-pg0-x241.google.com with SMTP id d193so4979805pgc.2;
 Wed, 12 Jul 2017 18:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oTU3Zq0Js9V4JpEGaZcOHnUBtzSri7kEKIgPIXh7b8E=;
 b=VnKzh+Gi/12ITbbNH7B5oVkexQZkKfZ1jqBNSnBVd9Ww5blCWVl8iN4PEmSSYBVBe3
 Fp945avrYi8BNOqFr7hWe/Om8eSijFNZlbKFMd6A67zQA+mAeh6Ii0xyOuSmogOy1Ovf
 xc3aeRQkLKHUQFEU6zVKxl0ND37WgpG5tQcv/tQChq4A07YiOk/nny3SlwY915fq+qct
 pHoY4rbc/+E+ORsnZ1RKJxb0LLO5/obvHpbpoIRHkfGybVEEfjn1AMPMUEZDHBW4xale
 dDVpTQS7/2RhhyDATglBSBZi4f+sdB4naw1N1b3+skmMGzDVORZd07cEntlxY3SubKo/
 N1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oTU3Zq0Js9V4JpEGaZcOHnUBtzSri7kEKIgPIXh7b8E=;
 b=Gme/jS/xa9lWau6GvGSQlWS1HU1cP4pAWqwM0XjdCLjF0YpJ4ppEju2sryZtjLYU7Z
 l/W4ZmzWORjbwlMhr7LVHZqOl4JbmmpcVJ1cY5sWg/ng7qZGpgJXnZOk9djdrrh/y56E
 dAuPVccxw4JPcq+NajfCC5aFjtwYKmAF/cCbuDIQL9hPD3wldcAsbfWwMr5VJIqOs7uS
 H2MsE5+Z0aNue1c9p8OdasrRWL69X864Illb4iGiMPNAZCy7T5ykmMZSmOr51OhOjjDl
 Jl4wIhNjt3Ufty5sZtnxII0M58fTxjRGDahkvZTjwJr2x5SBp2JeJwLo9NbGoxvxox5D
 4dxQ==
X-Gm-Message-State: AIVw110LuIsVZoFMIOEtGc6fbNeqPr58AMvxnZJcnUpdN+QREEGwjLNt
 vIcApBTOsG/Mf6c0pPw=
X-Received: by 10.98.37.196 with SMTP id l187mr7566454pfl.202.1499909932706;
 Wed, 12 Jul 2017 18:38:52 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id r73sm7117738pgr.32.2017.07.12.18.38.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 12 Jul 2017 18:38:51 -0700 (PDT)
Message-ID: <1499909927.8739.1.camel@gmail.com>
Subject: Re: [PATCH v8] pflash option to retrieve PNOR partition flags
From: Cyril Bur <cyrilbur@gmail.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Cc: stewart@linux.vnet.ibm.com
Date: Thu, 13 Jul 2017 11:38:47 +1000
In-Reply-To: <20170712203149.12123-1-mtritz@us.ibm.com>
References: <20170712203149.12123-1-mtritz@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.3 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Thu, 13 Jul 2017 01:38:56 -0000

On Wed, 2017-07-12 at 15:31 -0500, Michael Tritz wrote:
> This commit extends pflash with an option to retrieve and print
> information for a particular partition, including the content from
> "pflash -i" and a verbose list of set miscellaneous flags. -i option
> is also updated to print a short list of flags in addition to the
> ECC flag, with one character per flag. A test of the new option is
> included in libflash/test.
> 
> V8: Make check target now depends on having built pflash. Updated 
>     the path to pflash in the test script. Test script runs now.

Well it works :). It's hacky but until there are pflash tests it isn't
too bad.

I have something (pflash tests wise) that isn't too bad in progress
now. It's finding bugs so progress is slow (but overall this is a good
thing).

Cyril

Reviewed-by: Cyril Bur <cyril.bur@au1.ibm.com>

> V7: Fixed whitespace error and changed permissions on test script
> V6: Reverted change to has_ecc() to avoid breaking libffs
> 
> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
> ---
>  external/pflash/pflash.c          | 134 ++++++++++++++++++++++++++++++++++----
>  libflash/libffs.c                 |  11 +++-
>  libflash/libffs.h                 |   4 ++
>  libflash/test/Makefile.check      |   5 +-
>  libflash/test/test-miscprint.pnor | 103 +++++++++++++++++++++++++++++
>  libflash/test/test-miscprint.sh   |  28 ++++++++
>  6 files changed, 270 insertions(+), 15 deletions(-)
>  create mode 100644 libflash/test/test-miscprint.pnor
>  create mode 100755 libflash/test/test-miscprint.sh
> 
> diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
> index a344987e..3d172d71 100644
> --- a/external/pflash/pflash.c
> +++ b/external/pflash/pflash.c
> @@ -14,6 +14,8 @@
>   * limitations under the License.
>   */
>  
> +#define _GNU_SOURCE
> +
>  #include <stdio.h>
>  #include <stdlib.h>
>  #include <string.h>
> @@ -90,6 +92,7 @@ static void print_ffs_info(uint32_t toc_offset)
>  {
>  	struct ffs_handle *ffs_handle;
>  	uint32_t other_side_offset = 0;
> +	struct ffs_entry *ent;
>  	int rc;
>  	uint32_t i;
>  
> @@ -103,25 +106,40 @@ static void print_ffs_info(uint32_t toc_offset)
>  		return;
>  	}
>  
> -	for (i = 0;; i++) {
> +	for (i = 0; rc == 0; i++) {
>  		uint32_t start, size, act, end;
> -		bool ecc;
> -		char *name;
> +		char *name = NULL, *flags;
> +		int l;
>  
> -		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, &ecc);
> +		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, NULL);
>  		if (rc == FFS_ERR_PART_NOT_FOUND)
>  			break;
> -		if (rc) {
> -			fprintf(stderr, "Error %d scanning partitions\n", rc);
> -			break;
> +
> +		ent = ffs_entry_get(ffs_handle, i);
> +		if (rc || !ent) {
> +			fprintf(stderr, "Error %d scanning partitions\n",
> +					!ent ? FFS_ERR_PART_NOT_FOUND : rc);
> +		    goto out;
>  		}
> +
> +		l = asprintf(&flags, "[%c%c%c%c%c]",
> +				has_ecc(ent) ? 'E' : '-',
> +				has_flag(ent, FFS_MISCFLAGS_PRESERVED) ? 'P' : '-',
> +				has_flag(ent, FFS_MISCFLAGS_READONLY) ? 'R' : '-',
> +				has_flag(ent, FFS_MISCFLAGS_BACKUP) ? 'B' : '-',
> +				has_flag(ent, FFS_MISCFLAGS_REPROVISION) ? 'F' : '-');
> +		if (l < 0)
> +			goto out;
> +
>  		end = start + size;
>  		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
> -		       i, name, start, end, act, ecc ? "[ECC]" : "");
> +				i, name, start, end, act, flags);
>  
>  		if (strcmp(name, "OTHER_SIDE") == 0)
>  			other_side_offset = start;
>  
> +		free(flags);
> +out:
>  		free(name);
>  	}
>  
> @@ -413,6 +431,81 @@ static void disable_4B_addresses(void)
>  	}
>  }
>  
> +static void print_partition_detail(uint32_t toc_offset, uint32_t part_id, char *name)
> +{
> +	uint32_t start, size, act, end;
> +	struct ffs_handle *ffs_handle;
> +	char *ent_name = NULL, *flags;
> +	struct ffs_entry *ent;
> +	int rc, l;
> +
> +	rc = ffs_init(toc_offset, fl_total_size, bl, &ffs_handle, 0);
> +	if (rc) {
> +		fprintf(stderr, "Error %d opening ffs !\n", rc);
> +		return;
> +	}
> +
> +	if (name) {
> +		uint32_t i;
> +
> +		for (i = 0;;i++) {
> +			rc = ffs_part_info(ffs_handle, i, &ent_name, &start, &size, &act,
> +					NULL);
> +			if (rc == FFS_ERR_PART_NOT_FOUND) {
> +				fprintf(stderr, "Partition with name %s doesn't exist within TOC at 0x%08x\n", name, toc_offset);
> +				goto out;
> +			}
> +			if (rc || strncmp(ent_name, name, FFS_PART_NAME_MAX) == 0) {
> +				part_id = i;
> +				break;
> +			}
> +			free(ent_name);
> +			ent_name = NULL;
> +		}
> +	} else {
> +		rc = ffs_part_info(ffs_handle, part_id, &ent_name, &start, &size, &act,
> +				NULL);
> +		if (rc == FFS_ERR_PART_NOT_FOUND) {
> +			fprintf(stderr, "Partition with ID %d doesn't exist within TOC at 0x%08x\n",
> +			part_id, toc_offset);
> +			goto out;
> +		}
> +	}
> +	ent = ffs_entry_get(ffs_handle, part_id);
> +	if (rc || !ent) {
> +		fprintf(stderr, "Error %d scanning partitions\n", !ent ?
> +				FFS_ERR_PART_NOT_FOUND : rc);
> +		goto out;
> +	}
> +
> +	printf("Detailed partition information\n");
> +	end = start + size;
> +	printf("Name:\n");
> +	printf("%s (ID=%02d)\n\n", ent_name, part_id);
> +	printf("%-10s  %-10s  %-10s\n", "Start", "End", "Actual");
> +	printf("0x%08x  0x%08x  0x%08x\n\n", start, end, act);
> +
> +	printf("Flags:\n");
> +
> +	l = asprintf(&flags, "%s%s%s%s%s", has_ecc(ent) ? "ECC [E]\n" : "",
> +			has_flag(ent, FFS_MISCFLAGS_PRESERVED) ? "PRESERVED [P]\n" : "",
> +			has_flag(ent, FFS_MISCFLAGS_READONLY) ? "READONLY [R]\n" : "",
> +			has_flag(ent, FFS_MISCFLAGS_BACKUP) ? "BACKUP [B]\n" : "",
> +			has_flag(ent, FFS_MISCFLAGS_REPROVISION) ?
> +					"REPROVISION [F]\n" : "");
> +	if (l < 0) {
> +		fprintf(stderr, "Memory allocation failure printing flags!\n");
> +		goto out;
> +	}
> +
> +	printf("%s", flags);
> +	free(flags);
> +
> +out:
> +	ffs_close(ffs_handle);
> +	free(ent_name);
> +}
> +
>  static void print_version(void)
>  {
>  	printf("Open-Power Flash tool %s\n", version);
> @@ -494,6 +587,10 @@ static void print_help(const char *pname)
>  	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
>  	printf("\t-i, --info\n");
>  	printf("\t\tDisplay some information about the flash.\n\n");
> +	printf("\t--detail\n");
> +	printf("\t\tDisplays detailed info about a particular partition.\n");
> +	printf("\t\tAccepts a numeric partition or can be used in conjuction\n");
> +	printf("\t\twith the -P flag.\n\n");
>  	printf("\t-h, --help\n");
>  	printf("\t\tThis message.\n\n");
>  }
> @@ -508,7 +605,7 @@ void exiting(void)
>  int main(int argc, char *argv[])
>  {
>  	const char *pname = argv[0];
> -	uint32_t address = 0, read_size = 0, write_size = 0;
> +	uint32_t address = 0, read_size = 0, write_size = 0, detail_id = UINT_MAX;
>  	uint32_t erase_start = 0, erase_size = 0;
>  	bool erase = false, do_clear = false;
>  	bool program = false, erase_all = false, info = false, do_read = false;
> @@ -516,7 +613,7 @@ int main(int argc, char *argv[])
>  	bool show_help = false, show_version = false;
>  	bool no_action = false, tune = false;
>  	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
> -	bool ffs_toc_seen = false, direct = false;
> +	bool ffs_toc_seen = false, direct = false, print_detail = false;
>  	int rc;
>  
>  	while(1) {
> @@ -535,6 +632,7 @@ int main(int argc, char *argv[])
>  			{"force",	no_argument,		NULL,	'f'},
>  			{"flash-file",	required_argument,	NULL,	'F'},
>  			{"info",	no_argument,		NULL,	'i'},
> +			{"detail",  optional_argument,  NULL,   'm'},
>  			{"tune",	no_argument,		NULL,	't'},
>  			{"dummy",	no_argument,		NULL,	'd'},
>  			{"help",	no_argument,		NULL,	'h'},
> @@ -622,6 +720,11 @@ int main(int argc, char *argv[])
>  		case 'c':
>  			do_clear = true;
>  			break;
> +		case 'm':
> +			print_detail = true;
> +			if (optarg)
> +				detail_id = strtoul(optarg, NULL, 0);
> +			break;
>  		case ':':
>  			fprintf(stderr, "Unrecognised option \"%s\" to '%c'\n", optarg, optopt);
>  			no_action = true;
> @@ -651,7 +754,7 @@ int main(int argc, char *argv[])
>  	 * also tune them as a side effect
>  	 */
>  	no_action = no_action || (!erase && !program && !info && !do_read &&
> -		!enable_4B && !disable_4B && !tune && !do_clear);
> +		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
>  
>  	/* Nothing to do, if we didn't already, print usage */
>  	if (no_action && !show_version)
> @@ -684,6 +787,12 @@ int main(int argc, char *argv[])
>  		exit(1);
>  	}
>  
> +	if (print_detail && ((detail_id == UINT_MAX && !part_name)
> +			|| (detail_id != UINT_MAX && part_name))) {
> +		fprintf(stderr, "--detail requires either a partition id or\n");
> +		fprintf(stderr, "a partition name with -P\n");
> +	}
> +
>  	/* part-name and erase-all make no sense together */
>  	if (part_name && erase_all) {
>  		fprintf(stderr, "--partition and --erase-all are mutually"
> @@ -872,6 +981,9 @@ int main(int argc, char *argv[])
>  		print_flash_info(flash_side ? 0 : ffs_toc);
>  	}
>  
> +	if (print_detail)
> +		print_partition_detail(flash_side ? 0 : ffs_toc, detail_id, part_name);
> +
>  	/* Unlock flash (PNOR only) */
>  	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
>  		need_relock = arch_flash_set_wrprotect(bl, false);
> diff --git a/libflash/libffs.c b/libflash/libffs.c
> index 763e061c..daa62da6 100644
> --- a/libflash/libffs.c
> +++ b/libflash/libffs.c
> @@ -180,7 +180,12 @@ static int ffs_entry_to_cpu(struct ffs_hdr *hdr,
>  	return rc;
>  }
>  
> -static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
> +bool has_flag(struct ffs_entry *ent, uint16_t flag)
> +{
> +	return ((ent->user.miscflags & flag) != 0);
> +}
> +
> +struct ffs_entry *ffs_entry_get(struct ffs_handle *ffs, uint32_t index)
>  {
>  	int i = 0;
>  	struct ffs_entry *ent = NULL;
> @@ -369,7 +374,7 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  	struct ffs_entry *ent;
>  	char *n;
>  
> -	ent = ffs_get_part(ffs, part_idx);
> +	ent = ffs_entry_get(ffs, part_idx);
>  	if (!ent)
>  		return FFS_ERR_PART_NOT_FOUND;
>  
> @@ -776,7 +781,7 @@ int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>  	uint32_t offset;
>  	int rc;
>  
> -	ent = ffs_get_part(ffs, part_idx);
> +	ent = ffs_entry_get(ffs, part_idx);
>  	if (!ent) {
>  		FL_DBG("FFS: Entry not found\n");
>  		return FFS_ERR_PART_NOT_FOUND;
> diff --git a/libflash/libffs.h b/libflash/libffs.h
> index 2c1fbd83..a86c698f 100644
> --- a/libflash/libffs.h
> +++ b/libflash/libffs.h
> @@ -92,6 +92,8 @@ struct ffs_entry_user {
>  
>  bool has_ecc(struct ffs_entry *ent);
>  
> +bool has_flag(struct ffs_entry *ent, uint16_t flag);
> +
>  /* Init */
>  
>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
> @@ -126,6 +128,8 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  		  char **name, uint32_t *start,
>  		  uint32_t *total_size, uint32_t *act_size, bool *ecc);
>  
> +struct ffs_entry *ffs_entry_get(struct ffs_handle *ffs, uint32_t index);
> +
>  int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>  			uint32_t act_size);
>  
> diff --git a/libflash/test/Makefile.check b/libflash/test/Makefile.check
> index 1f92b9d2..b679341d 100644
> --- a/libflash/test/Makefile.check
> +++ b/libflash/test/Makefile.check
> @@ -4,7 +4,7 @@ LIBFLASH_TEST := libflash/test/test-flash libflash/test/test-ecc libflash/test/t
>  LCOV_EXCLUDE += $(LIBFLASH_TEST:%=%.c)
>  
>  .PHONY : libflash-check libc-coverage
> -libflash-check: $(LIBFLASH_TEST:%=%-check) $(CORE_TEST:%=%-gcov-run)
> +libflash-check: $(LIBFLASH_TEST:%=%-check) libflash/test/test-miscprint $(CORE_TEST:%=%-gcov-run)
>  libflash-coverage: $(LIBFLASH_TEST:%=%-gcov-run)
>  
>  check: libflash-check libc-coverage
> @@ -16,6 +16,9 @@ $(LIBFLASH_TEST:%=%-gcov-run) : %-run: %
>  $(LIBFLASH_TEST:%=%-check) : %-check: %
>  	$(call QTEST, RUN-TEST ,$(VALGRIND) $<, $<)
>  
> +libflash/test/test-miscprint: pflash
> +	$(call Q, RUN-TEST , ./libflash/test/test-miscprint.sh ,  $@)
> +
>  libflash/test/stubs.o: libflash/test/stubs.c
>  	$(call Q, HOSTCC ,$(HOSTCC) $(HOSTCFLAGS) -g -c -o $@ $<, $<)
>  
> diff --git a/libflash/test/test-miscprint.pnor b/libflash/test/test-miscprint.pnor
> new file mode 100644
> index 00000000..e3f3d355
> --- /dev/null
> +++ b/libflash/test/test-miscprint.pnor
> @@ -0,0 +1,103 @@
> +504152540000000100000001000000800000000500000300000000040000
> +0000000000000000000000000000504151d5706172740000000000000000
> +000000000000000000000001ffffffff0000000100000003000000010000
> +030000000000000000000000000000000000000000000000000000000000
> +000000000000000000000000000000000000000000000000000000000000
> +000000000000000000000000000000000000000000008f9e8e8950524553
> +4552564544000000000000000000000100000000ffffffff000000020000
> +000100000000000001000000000000000000000000000000000000000000
> +008000000000000000000000000000000000000000000000000000000000
> +000000000000000000000000000000000000000000000000000000000000
> +ae7fedeb524541444f4e4c5900000000000000000000000100000000ffff
> +ffff00000003000000010000000000000100000000000000000000000000
> +000000000000000000400000000000000000000000000000000000000000
> +000000000000000000000000000000000000000000000000000000000000
> +0000000000000000e2b4f3e1524550524f564953494f4e00000000000000
> +000100000000ffffffff0000000400000001000000000000010000000000
> +000000000000000000000000000000000010000000000000000000000000
> +000000000000000000000000000000000000000000000000000000000000
> +00000000000000000000000000000000abb3a9fa4241434b555000000000
> +0000000000000000000200000000ffffffff000000050000000100000000
> +000001000000000000000000000000000000000000000000002000000000
> +000000000000000000000000000000000000000000000000000000000000
> +000000000000000000000000000000000000000000000000e8cebdb2ffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
> +ffffffffffffffffffffffff
> diff --git a/libflash/test/test-miscprint.sh b/libflash/test/test-miscprint.sh
> new file mode 100755
> index 00000000..57273967
> --- /dev/null
> +++ b/libflash/test/test-miscprint.sh
> @@ -0,0 +1,28 @@
> +#!/bin/bash
> +
> +# test-miscprint.pnor is constructed as follows:
> +# PRESERVED,0x00000300,0x00000100,P,/dev/zero
> +# READONLY,0x00000400,0x00000100,R,/dev/zero
> +# REPROVISION,0x00000500,0x00000100,F,/dev/zero
> +# BACKUP,0x00000600,0x00000100,B,/dev/zero
> +
> +wd="libflash/test"
> +pflash="external/pflash/pflash"
> +
> +{
> +    xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
> +
> +    output1=$(${pflash} --detail=1 -F "$wd/temp.pnor" | grep "\[P\]")
> +    output2=$(${pflash} --detail=2 -F "$wd/temp.pnor" | grep "\[R\]")
> +    output3=$(${pflash} --detail=3 -F "$wd/temp.pnor" | grep "\[F\]")
> +    output4=$(${pflash} --detail=4 -F "$wd/temp.pnor" | grep "\[B\]")
> +
> +    if [[ $output1 == "PRESERVED [P]" && $output2 == "READONLY [R]" &&
> +          $output3 == "REPROVISION [F]" && $output4 == "BACKUP [B]" ]]; then
> +        echo "Test passed!"
> +    else
> +        echo "Test failed!"
> +    fi
> +
> +    rm "$wd/temp.pnor"
> +} > "$wd/test-miscprint.o"
