Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wrYMf0xJ9zDq88;
 Mon, 19 Jun 2017 11:30:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zu1Nx1xS"; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id y7so14433007pfd.3;
 Sun, 18 Jun 2017 18:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yOoD3ZtfxEEumhZddol6w9Dc00/lyjiB/v/2vhWAWnI=;
 b=Zu1Nx1xSVqAucyplYL5OVbSYJDSJY6YnqT+sBHl+jP3Lh3SbSJslIIfGEjTYDutkYV
 qwoeWdQNCuifqXoX3hq/lI1EYIfWCFYs9rBFqQdERqCg+gMRLH3IFIQWasqLNqM87hIy
 V7veZzw9iklF4hXSyvCd1BNkHIQj1g12C+cl/2xuXXa+68FlhEM/FK4bHRBLpxyiZBAU
 VP1LOq0egLpH+8kfILDuGigna0b/nSnXR9FNAjhu69vc149IjPNt7td2dSDMBl6g7Ead
 0Ts3IM/457KCIBkiNuyyWVpym6+LbV+poGtlAGSzrtgFmBQrvl/Ip2JJXiiTn9+YhTnV
 hf2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yOoD3ZtfxEEumhZddol6w9Dc00/lyjiB/v/2vhWAWnI=;
 b=X7i36ySb4Qcl9pKQ+cBw/HyLwFQG7CbxUyMyTz8Tb6LR26PYh6ufoyNdkJ28lSkVlF
 ypzWwUQpoTg07fcky//zEFOY0v+r0cl/NOl9OAar3olfskyKsVqQ2gGWxOTssVhOkC4S
 MniOVt47+3Vp1uSbgYXihxU4dQo4LW71G2Xyt54rOXViiLhyB08GbwrAyBOnJdjD8EjB
 Xk9b+6jKE8KAYwPG5Ciq5QVuTfYDl+al0LSLqtbelpyC9JnZnmIzDl9f7iNnYFTIo2AK
 AyIInFWtALIgVB+MWnUsG5qpGO/kuPdj4lg0bHJojdGi6uy2K/Z0u5cU+2uUG+xN8dEZ
 HBJw==
X-Gm-Message-State: AKS2vOwKYFKyXOyqtwfDMfH7mzrrxLRN2qWjDTrj+/irUe2QuS9Ca8Rf
 k9HQM8Y1tndfLQ==
X-Received: by 10.84.214.150 with SMTP id j22mr26508312pli.137.1497835850864; 
 Sun, 18 Jun 2017 18:30:50 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id 66sm20031165pgh.59.2017.06.18.18.30.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 18 Jun 2017 18:30:50 -0700 (PDT)
Message-ID: <1497835846.3613.2.camel@gmail.com>
Subject: Re: [PATCH v3] pflash option to retrieve PNOR partition flags
From: Cyril Bur <cyrilbur@gmail.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Date: Mon, 19 Jun 2017 11:30:46 +1000
In-Reply-To: <20170615231020.56263-1-mtritz@us.ibm.com>
References: <20170615231020.56263-1-mtritz@us.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.24.2 
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
X-List-Received-Date: Mon, 19 Jun 2017 01:30:55 -0000

On Thu, 2017-06-15 at 18:10 -0500, Michael Tritz wrote:
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
>  external/pflash/pflash.c          |  86 ++++++++++++++++++++++++++++---
>  libflash/libffs.c                 |  26 +++++++++-
>  libflash/libffs.h                 |   5 ++
>  libflash/test/test-miscprint.pnor | 103 ++++++++++++++++++++++++++++++++++++++
>  libflash/test/test-miscprint.sh   |  40 +++++++++++++++
>  5 files changed, 252 insertions(+), 8 deletions(-)
>  create mode 100644 libflash/test/test-miscprint.pnor
>  create mode 100644 libflash/test/test-miscprint.sh
> 
> diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
> index a344987e..74c0adf8 100644
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
> @@ -89,6 +91,7 @@ static void check_confirm(void)
>  static void print_ffs_info(uint32_t toc_offset)
>  {
>  	struct ffs_handle *ffs_handle;
> +	struct ffs_entry_user ent_user;
>  	uint32_t other_side_offset = 0;
>  	int rc;
>  	uint32_t i;
> @@ -115,9 +118,21 @@ static void print_ffs_info(uint32_t toc_offset)
>  			fprintf(stderr, "Error %d scanning partitions\n", rc);
>  			break;
>  		}
> +
> +		ent_user = ffs_entry_user_get(ffs_get_part(ffs_handle, i));
> +
> +		char *flags;
> +		int l;
> +		l = asprintf(&flags, "[%c%c%c%c%c]",
> +					(ecc) ? 'E' : '-',
> +					has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED) ? 'P' : '-',
> +					has_flag(&ent_user, FFS_MISCFLAGS_READONLY) ? 'R' : '-',
> +					has_flag(&ent_user, FFS_MISCFLAGS_BACKUP) ? 'B' : '-',
> +					has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION) ? 'F' : '-');
> +
>  		end = start + size;
>  		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
> -		       i, name, start, end, act, ecc ? "[ECC]" : "");
> +		       i, name, start, end, act, (l != -1) ? flags : NULL);

Passing NULL here is interesting - I've seen various libcs so
interesting things over the years, notably (admittedly this hasn't
happened for a while) segfault if a %s has a corresponding NULL. I've
also seen it print literally "(null)" which is not going to look good.

Might I suggest just checking l after the call the asprintf, I might
also be a good idea to exit if memory allocation fails.

>  

You should free(flags); here

>  		if (strcmp(name, "OTHER_SIDE") == 0)
>  			other_side_offset = start;
> @@ -413,6 +428,56 @@ static void disable_4B_addresses(void)
>  	}
>  }
>  
> +static void print_partition_detail(uint32_t part_ID)
> +{
> +	struct ffs_handle *ffs_handle;
> +	struct ffs_entry_user ent_user;
> +	int rc;
> +	uint32_t start, size, act, end;
> +	bool ecc;
> +	char *name;
> +
> +	rc = ffs_init(0, fl_total_size, bl, &ffs_handle, 0);
> +	if (rc) {
> +		fprintf(stderr, "Error %d opening ffs !\n", rc);
> +		return;
> +	}
> +
> +	rc = ffs_part_info(ffs_handle, part_ID, &name, &start, &size, &act, &ecc);
> +	if (rc == FFS_ERR_PART_NOT_FOUND)
> +		return;
> +	if (rc) {
> +		fprintf(stderr, "Error %d scanning partitions\n", rc);
> +		return;
> +	}
> +
> +	ent_user = ffs_entry_user_get(ffs_get_part(ffs_handle, part_ID));
> +
> +	ffs_close(ffs_handle);
> +
> +	end = start + size;
> +	printf("ID=%02d - %s %08x..%08x (actual=%08x)\n",
> +		   part_ID, name, start, end, act);
> +
> +	char *flags;
> +	int l;
> +	l = asprintf(&flags, "%s%s%s%s%s",
> +				(ecc) ? "ECC," : "",
> +				has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED) ?
> +						"PRESERVED," : "",
> +				has_flag(&ent_user, FFS_MISCFLAGS_READONLY) ? "READONLY," : "",
> +				has_flag(&ent_user, FFS_MISCFLAGS_BACKUP) ? "BACKUP," : "",
> +				has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION) ?
> +						"REPROVISION." : "");

I'm pretty sure I've pointed this out before - are we just going to
accept that the output will look odd if there isn't a reprovision flag?

> +	if (l > 0)
> +	{
> +		flags[l-1] = '\n';

Ummmmm, why not put the '\n' after all the %s in the asprintf format
string?

> +		printf(flags);

Lets free(flags); here too.

> +	}
> +
> +	return;
> +}
> +
>  static void print_version(void)
>  {
>  	printf("Open-Power Flash tool %s\n", version);
> @@ -494,6 +559,9 @@ static void print_help(const char *pname)
>  	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
>  	printf("\t-i, --info\n");
>  	printf("\t\tDisplay some information about the flash.\n\n");
> +	printf("\t-m --misc\n");
> +	printf("\t\tDisplays miscellaneous info about a particular partition.\n");
> +	printf("\t\tRequires the numerical partition index as an argument.\n\n");
>  	printf("\t-h, --help\n");
>  	printf("\t\tThis message.\n\n");
>  }
> @@ -508,7 +576,7 @@ void exiting(void)
>  int main(int argc, char *argv[])
>  {
>  	const char *pname = argv[0];
> -	uint32_t address = 0, read_size = 0, write_size = 0;
> +	uint32_t address = 0, read_size = 0, write_size = 0, part_ID = 0;
>  	uint32_t erase_start = 0, erase_size = 0;
>  	bool erase = false, do_clear = false;
>  	bool program = false, erase_all = false, info = false, do_read = false;
> @@ -516,7 +584,7 @@ int main(int argc, char *argv[])
>  	bool show_help = false, show_version = false;
>  	bool no_action = false, tune = false;
>  	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
> -	bool ffs_toc_seen = false, direct = false;
> +	bool ffs_toc_seen = false, direct = false, print_detail = false;
>  	int rc;
>  
>  	while(1) {
> @@ -534,7 +602,7 @@ int main(int argc, char *argv[])
>  			{"program",	required_argument,	NULL,	'p'},
>  			{"force",	no_argument,		NULL,	'f'},
>  			{"flash-file",	required_argument,	NULL,	'F'},
> -			{"info",	no_argument,		NULL,	'i'},
> +			{"info",	no_argument,  		NULL,	'i'},
>  			{"tune",	no_argument,		NULL,	't'},
>  			{"dummy",	no_argument,		NULL,	'd'},
>  			{"help",	no_argument,		NULL,	'h'},
> @@ -547,7 +615,7 @@ int main(int argc, char *argv[])
>  		};
>  		int c, oidx = 0;
>  
> -		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:",
> +		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:m:",
>  				long_opts, &oidx);
>  		if (c == -1)
>  			break;
> @@ -622,6 +690,10 @@ int main(int argc, char *argv[])
>  		case 'c':
>  			do_clear = true;
>  			break;
> +		case 'm':
> +			print_detail = true;
> +			part_ID = strtoul(optarg, NULL, 10);

Couldn't we require that -m be used in conjunction with -P flag? I
think there's already a precedent.

I would have called the actual command line argument --detail but sure.

> +			break;
>  		case ':':
>  			fprintf(stderr, "Unrecognised option \"%s\" to '%c'\n", optarg, optopt);
>  			no_action = true;
> @@ -651,7 +723,7 @@ int main(int argc, char *argv[])
>  	 * also tune them as a side effect
>  	 */
>  	no_action = no_action || (!erase && !program && !info && !do_read &&
> -		!enable_4B && !disable_4B && !tune && !do_clear);
> +		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
>  
>  	/* Nothing to do, if we didn't already, print usage */
>  	if (no_action && !show_version)
> @@ -871,6 +943,8 @@ int main(int argc, char *argv[])
>  		 */
>  		print_flash_info(flash_side ? 0 : ffs_toc);
>  	}
> +	if (print_detail)
> +		print_partition_detail(part_ID);
>  
>  	/* Unlock flash (PNOR only) */
>  	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
> diff --git a/libflash/libffs.c b/libflash/libffs.c
> index 763e061c..1a9ce82a 100644
> --- a/libflash/libffs.c
> +++ b/libflash/libffs.c
> @@ -180,7 +180,7 @@ static int ffs_entry_to_cpu(struct ffs_hdr *hdr,
>  	return rc;
>  }
>  
> -static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
> +struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>  {
>  	int i = 0;
>  	struct ffs_entry *ent = NULL;
> @@ -195,7 +195,16 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>  
>  bool has_ecc(struct ffs_entry *ent)
>  {
> -	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
> +	struct ffs_entry_user entry_user = ffs_entry_user_get(ent);
> +	return has_flag(&entry_user, FFS_ENRY_INTEG_ECC);
> +}
> +
> +bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG)
> +{
> +	if (FLAG == FFS_ENRY_INTEG_ECC) {
> +		return ((ent_user->datainteg & FFS_ENRY_INTEG_ECC) != 0);
> +	}
> +	return ((ent_user->miscflags & FLAG) != 0);
>  }
>  
>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
> @@ -546,6 +555,19 @@ int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int sid
>  	return rc;
>  }
>  
> +struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry)
> +{
> +	struct ffs_entry_user entry_user;
> +
> +	entry_user.chip = entry->user.chip;
> +	entry_user.compresstype = entry->user.compresstype;
> +	entry_user.datainteg = entry->user.datainteg;
> +	entry_user.vercheck = entry->user.vercheck;
> +	entry_user.miscflags = entry->user.miscflags;
> +

Could you memcpy() this?

> +	return entry_user;
> +}
> +
>  /* This should be done last! */
>  int ffs_hdr_create_backup(struct ffs_hdr *hdr)
>  {
> diff --git a/libflash/libffs.h b/libflash/libffs.h
> index 2c1fbd83..72ae4a1c 100644
> --- a/libflash/libffs.h
> +++ b/libflash/libffs.h
> @@ -89,9 +89,12 @@ struct ffs_entry_user {
>  #define FFS_MISCFLAGS_BACKUP 0x20
>  #define FFS_MISCFLAGS_REPROVISION 0x10
>  
> +struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index);
>  
>  bool has_ecc(struct ffs_entry *ent);
>  
> +bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG);

Caps?

> +
>  /* Init */
>  
>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
> @@ -140,6 +143,8 @@ int ffs_entry_user_set(struct ffs_entry *ent, struct ffs_entry_user *user);
>  
>  int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int side);
>  
> +struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry);
> +
>  int ffs_hdr_create_backup(struct ffs_hdr *hdr);
>  
>  int ffs_hdr_finalise(struct blocklevel_device *bl, struct ffs_hdr *hdr);
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
> index 00000000..7670b6e4
> --- /dev/null
> +++ b/libflash/test/test-miscprint.sh
> @@ -0,0 +1,40 @@
> +#!/bin/bash
> +
> +# test-miscprint.pnor is constructed as follows:
> +# PRESERVED,0x00000300,0x00000100,P,/dev/zero
> +# READONLY,0x00000400,0x00000100,R,/dev/zero
> +# REPROVISION,0x00000500,0x00000100,F,/dev/zero
> +# BACKUP,0x00000600,0x00000100,B,/dev/zero
> +
> +pass=false
> +wd=$(dirname -- "$0")
> +
> +xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
> +
> +output=$(pflash -m 1 -F "$wd/temp.pnor" | grep ,)
> +if [[ $output == "PRESERVED" ]]; then
> +    pass=true
> +fi
> +
> +output=$(pflash -m 2 -F "$wd/temp.pnor" | grep ,)
> +if [[ $output == "READONLY" ]]; then
> +    pass=true
> +fi
> +
> +output=$(pflash -m 3 -F "$wd/temp.pnor" | grep ,)
> +if [[ $output == "REPROVISION" ]]; then
> +    pass=true
> +fi
> +
> +output=$(pflash -m 4 -F "$wd/temp.pnor" | grep ,)
> +if [[ $output == "BACKUP" ]]; then
> +    pass=true
> +fi
> +
> +if [[ pass ]]; then
> +    echo "Test passed!"
> +else
> +    echo "Test failed!"
> +fi
> +
> +rm "$wd/temp.pnor"
