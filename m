Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x243.google.com (mail-pg0-x243.google.com
 [IPv6:2607:f8b0:400e:c05::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3x18Hj589gzDr3Z;
 Mon,  3 Jul 2017 11:12:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gdvm3SIF"; 
 dkim-atps=neutral
Received: by mail-pg0-x243.google.com with SMTP id u36so21343716pgn.3;
 Sun, 02 Jul 2017 18:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YvDVDtaFK5C8bXtEI/3Iz8rPi/qCkP46FDwEIU8dq78=;
 b=Gdvm3SIFBwpP6EtQUmkjUUhJavXTwPkIuF9tjd3Y1KyQ3KaQbIE8ZtfxdWxtIhzlcU
 PMjaVSkT+6NtqxgAJa7mifhUKMmTP5pV8MQJ2XYTRG0aVfUyP/saEPsI0JqOBQVgQa7I
 GlfXKyt0JNGRkuTDA7TROQH2QPv+MW7/OZdxzwtj4P0IXzGDQ+lXeDQ+R4eU9gXo2cVz
 KM+9jJhQrzxPWQjWDRISRawV2m1In125him+hafVcxNfxilLxi3j6wvZg8IOxM9tl8sy
 PgEyiBrQDFw/wnzRxvfvpTiuc+Bdv1/itZcibtqFCp10Rt3yPrhfvzssJecTu4t7RENj
 J+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YvDVDtaFK5C8bXtEI/3Iz8rPi/qCkP46FDwEIU8dq78=;
 b=ZCELbTj62BPjFky+QQ2bCDoS2vTwCCGsUF39UIUToIBTLo5EWWcnQ9Vg2vy9e3+17P
 wd0BZz53+yn0ZZjoGsXm2Y9+qG325FOsf6AZFUcQEQNePOXGdrJxIlL0Glh8XPooN1Y/
 QVtNoRU2tqXSCJMJf342kLakg2EABwq3Fk9VFlMntrVguBGbbvoTxc/q+oHvT5Cu5YmG
 r2SPtOnovfH/eRGqXU8HXoTSWOYiiOgXwsRIOXzTHxzBWP1frn0UWq/Z77plBVQFlXyX
 QY0+U066G02U+MiswueFUQgT3rRNC5MgjfDDzuSer0aNkdt9ShNsDE9eCmHDluLQnAZ6
 Ol/A==
X-Gm-Message-State: AIVw113s/WVntv1GaYPLUvayjW880nZrsTb3MasIq8IllusmJE5ylbAY
 UPu70NWHOvT+ediyDsQ=
X-Received: by 10.84.234.22 with SMTP id m22mr7765789plk.268.1499044335235;
 Sun, 02 Jul 2017 18:12:15 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id u2sm38025716pgn.28.2017.07.02.18.12.12
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Jul 2017 18:12:14 -0700 (PDT)
Message-ID: <1499044329.1700.5.camel@gmail.com>
Subject: Re: [PATCH v5] pflash option to retrieve PNOR partition flags
From: Cyril Bur <cyrilbur@gmail.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Cc: stewart@linux.vnet.ibm.com
Date: Mon, 03 Jul 2017 11:12:09 +1000
In-Reply-To: <20170630182953.28853-1-mtritz@us.ibm.com>
References: <20170630182953.28853-1-mtritz@us.ibm.com>
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
X-List-Received-Date: Mon, 03 Jul 2017 01:12:18 -0000

On Fri, 2017-06-30 at 13:29 -0500, Michael Tritz wrote:
> This commit extends pflash with an option to retrieve and print
> information for a particular partition, including the content from
> "pflash -i" and a verbose list of set miscellaneous flags. -i option
> is also updated to print a short list of flags in addition to the
> ECC flag, with one character per flag. A test of the new option is
> included in libflash/test.
> 
> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>
> ---

It is customary to put a little rundown of what changed between
versions here. This makes review easier :)

For example
V5:
  Added tests to make check
  Fixed indenting

>  external/pflash/pflash.c          | 134 ++++++++++++++++++++++++++++++++++----
>  libflash/libffs.c                 |  19 +++---
>  libflash/libffs.h                 |   8 ++-
>  libflash/test/Makefile.check      |   5 +-
>  libflash/test/test-miscprint.pnor | 103 +++++++++++++++++++++++++++++
>  libflash/test/test-miscprint.sh   |  27 ++++++++
>  6 files changed, 275 insertions(+), 21 deletions(-)
>  create mode 100644 libflash/test/test-miscprint.pnor
>  create mode 100644 libflash/test/test-miscprint.sh
> 
> diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
> index a344987e..9d57feea 100644
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
> +            		NULL);
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
> index 763e061c..5acfe837 100644
> --- a/libflash/libffs.c
> +++ b/libflash/libffs.c
> @@ -180,7 +180,15 @@ static int ffs_entry_to_cpu(struct ffs_hdr *hdr,
>  	return rc;
>  }
>  
> -static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
> +bool has_flag(struct ffs_entry *ent, uint16_t flag)
> +{
> +	if (flag == FFS_ENRY_INTEG_ECC) {
> +		return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
> +	}
> +	return ((ent->user.miscflags & flag) != 0);
> +}
> +
> +struct ffs_entry *ffs_entry_get(struct ffs_handle *ffs, uint32_t index)
>  {
>  	int i = 0;
>  	struct ffs_entry *ent = NULL;
> @@ -193,11 +201,6 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>  	return NULL;
>  }
>  
> -bool has_ecc(struct ffs_entry *ent)
> -{
> -	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
> -}
> -
>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
>  		struct ffs_handle **ffs, bool mark_ecc)
>  {
> @@ -369,7 +372,7 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  	struct ffs_entry *ent;
>  	char *n;
>  
> -	ent = ffs_get_part(ffs, part_idx);
> +	ent = ffs_entry_get(ffs, part_idx);
>  	if (!ent)
>  		return FFS_ERR_PART_NOT_FOUND;
>  
> @@ -776,7 +779,7 @@ int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>  	uint32_t offset;
>  	int rc;
>  
> -	ent = ffs_get_part(ffs, part_idx);
> +	ent = ffs_entry_get(ffs, part_idx);
>  	if (!ent) {
>  		FL_DBG("FFS: Entry not found\n");
>  		return FFS_ERR_PART_NOT_FOUND;
> diff --git a/libflash/libffs.h b/libflash/libffs.h
> index 2c1fbd83..aaa062ae 100644
> --- a/libflash/libffs.h
> +++ b/libflash/libffs.h
> @@ -89,8 +89,12 @@ struct ffs_entry_user {
>  #define FFS_MISCFLAGS_BACKUP 0x20
>  #define FFS_MISCFLAGS_REPROVISION 0x10
>  
> +bool has_flag(struct ffs_entry *ent, uint16_t flag);
>  
> -bool has_ecc(struct ffs_entry *ent);
> +static inline bool has_ecc(struct ffs_entry *ent)
> +{
> +	return has_flag(ent, FFS_ENRY_INTEG_ECC);
> +}
>  

So I got to thinking, after being happy with this - wouldn't this break
binaries dynamically linked? This would actually make the symbol go
away and interesting things will happen to binaries which expect to
find a real has_ecc(). We might actually have to leave has_ecc() and
inside the .c just call has_flag.


Joel got quite angry last time I broke libflash/libffs.


>  /* Init */
>  
> @@ -126,6 +130,8 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  		  char **name, uint32_t *start,
>  		  uint32_t *total_size, uint32_t *act_size, bool *ecc);
>  
> +struct ffs_entry *ffs_entry_get(struct ffs_handle *ffs, uint32_t index);
> +
>  int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>  			uint32_t act_size);
>  
> diff --git a/libflash/test/Makefile.check b/libflash/test/Makefile.check
> index 1f92b9d2..419a50a9 100644
> --- a/libflash/test/Makefile.check
> +++ b/libflash/test/Makefile.check
> @@ -4,7 +4,7 @@ LIBFLASH_TEST := libflash/test/test-flash libflash/test/test-ecc libflash/test/t
>  LCOV_EXCLUDE += $(LIBFLASH_TEST:%=%.c)
>  
>  .PHONY : libflash-check libc-coverage
> -libflash-check: $(LIBFLASH_TEST:%=%-check) $(CORE_TEST:%=%-gcov-run)
> +libflash-check: $(LIBFLASH_TEST:%=%-check) libflash/test/test-miscprint $(CORE_TEST:%=%-gcov-run)

This will probably do for now, definitely have to refactor into pflash
tests if I ever get enough cycles to make them good.

>  libflash-coverage: $(LIBFLASH_TEST:%=%-gcov-run)
>  
>  check: libflash-check libc-coverage
> @@ -16,6 +16,9 @@ $(LIBFLASH_TEST:%=%-gcov-run) : %-run: %
>  $(LIBFLASH_TEST:%=%-check) : %-check: %
>  	$(call QTEST, RUN-TEST ,$(VALGRIND) $<, $<)
>  
> +libflash/test/test-miscprint:
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
> new file mode 100644
> index 00000000..224328be
> --- /dev/null
> +++ b/libflash/test/test-miscprint.sh
> @@ -0,0 +1,27 @@
> +#!/bin/bash
> +
> +# test-miscprint.pnor is constructed as follows:
> +# PRESERVED,0x00000300,0x00000100,P,/dev/zero
> +# READONLY,0x00000400,0x00000100,R,/dev/zero
> +# REPROVISION,0x00000500,0x00000100,F,/dev/zero
> +# BACKUP,0x00000600,0x00000100,B,/dev/zero
> +
> +wd=$(dirname -- "$0")
> +
> +{
> +	xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
> +
> +	output1=$(pflash --detail=1 -F "$wd/temp.pnor" | grep "\[P\]")
> +	output2=$(pflash --detail=2 -F "$wd/temp.pnor" | grep "\[R\]")
> +	output3=$(pflash --detail=3 -F "$wd/temp.pnor" | grep "\[F\]")
> +	output4=$(pflash --detail=4 -F "$wd/temp.pnor" | grep "\[B\]")
> +
> +	if [[ $output1 == "PRESERVED [P]" && $output2 == "READONLY [R]" &&
> +	      $output3 == "REPROVISION [F]" && $output4 == "BACKUP [B]" ]]; then
> +	    echo "Test passed!"
> +	else
> +	    echo "Test failed!"
> +	fi
> +
> +	rm "$wd/temp.pnor"
> +} > "$wd/test-miscprint.o"
