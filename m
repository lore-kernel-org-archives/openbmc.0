Return-Path: <cyrilbur@gmail.com>
Received: from mail-pg0-x242.google.com (mail-pg0-x242.google.com
 [IPv6:2607:f8b0:400e:c05::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3wmsmZ2cK3zDqL8;
 Tue, 13 Jun 2017 11:36:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HVtN+qoA"; 
 dkim-atps=neutral
Received: by mail-pg0-x242.google.com with SMTP id a70so15904797pge.0;
 Mon, 12 Jun 2017 18:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6wc6cQxLcJKIUmW34o7ugjC3NyhyHEr3vI+RKGdq+5w=;
 b=HVtN+qoAsW4AkQqkZQvZsTiymbCpkxDZveC+qEnwLsx88dcSp5cSSy0jgwhW1scxC6
 mi5FSNxWT+qbGzxd9OlnH3sK+1NDGrPvNj4pn7GnrwmiwDzQWfCHEBxBWhp3aWfx9FOM
 p746p+IbYPOw8cfR+lAZdHi9sVpXHSikyHVMkXDT5hYI42D+IrxErTEUZt3/DpCMhSi0
 Zs78GlZG2arDyz+HF9VWqAckOui4cZSXoOfSN5mtQ1WEtNcVMLfVPGP+LOjbpS0Vs7jG
 GuQdoE07iUmur3LpOAGKMrl4i4Km4REaJQF31SwO7P/ukSn637I7uZ7zeg+6DqlZxxM3
 S6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wc6cQxLcJKIUmW34o7ugjC3NyhyHEr3vI+RKGdq+5w=;
 b=PaDCeTwYpmiEvQ+3NS6et6U5Qi2CXgyuN/OHQCk/t2GzFv7xetCKCb8fYTiI3aYK7U
 aR6j4198mCRCVa+b+nM5WikCwwTAhUdK90rea4Qj4TxKjAzl7YGTLCBw9Rqsj9xtQiTV
 zcDOC2vGeIt7pzt7LY14TqVPAILJs7XvclCPGYFL2P77enPefDqOzeRNEUeKebsnTcOu
 juPLNche3Yvfxj2BRzxWWwcKPjQkD9/Pr7IY8JvIwdJK5RAsnvVRGgCtA/l9wF7GQWnQ
 obhl172vdx8ONhNcTsnODxXUZ8z5iRKip9SzSO5TEQlm7JRZjxt8UJm1kxv8cVwZsJva
 uTjw==
X-Gm-Message-State: AODbwcB+S8BvP2xHfeQYBmYmFJNhrcTnLpK17HzL95mM9LXdEjb9MVeA
 3JxqttKcwb8n1w==
X-Received: by 10.99.106.66 with SMTP id f63mr58668339pgc.150.1497317770566;
 Mon, 12 Jun 2017 18:36:10 -0700 (PDT)
Received: from camb691.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id n26sm2898396pfj.114.2017.06.12.18.36.07
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 12 Jun 2017 18:36:08 -0700 (PDT)
Message-ID: <1497317764.4499.2.camel@gmail.com>
Subject: Re: [PATCH] pflash option to retrieve PNOR partition flags
From: Cyril Bur <cyrilbur@gmail.com>
To: Michael Tritz <mtritz@us.ibm.com>, skiboot@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org
Date: Tue, 13 Jun 2017 11:36:04 +1000
In-Reply-To: <20170609195455.22309-1-mtritz@us.ibm.com>
References: <20170609195455.22309-1-mtritz@us.ibm.com>
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
X-List-Received-Date: Tue, 13 Jun 2017 01:36:15 -0000

On Fri, 2017-06-09 at 14:54 -0500, Michael Tritz wrote:
> This commit extends pflash with an option to retrieve and print
> information for a particular partition, including the content from
> "pflash -i" and a verbose list of set miscellaneous flags. -i option
> is also updated to print a short list of flags in addition to the
> ECC flag, with one character per flag. A test of the new option is
> included in libflash/test.
> 
> Change-Id: Iebb8a6d34c537cecd2eb44ddf41271c8fbe25258
> Signed-off-by: Michael Tritz <mtritz@us.ibm.com>

Should this be V2?

> ---
>  external/pflash/pflash.c          |  88 ++++++++++++++++++++++++++++----
>  libflash/libffs.c                 |  41 ++++++++++++---
>  libflash/libffs.h                 |  16 +++++-
>  libflash/test/test-miscprint.pnor | 103 ++++++++++++++++++++++++++++++++++++++
>  libflash/test/test-miscprint.sh   |  40 +++++++++++++++
>  5 files changed, 269 insertions(+), 19 deletions(-)
>  create mode 100644 libflash/test/test-miscprint.pnor
>  create mode 100644 libflash/test/test-miscprint.sh
> 
> diff --git a/external/pflash/pflash.c b/external/pflash/pflash.c
> index a344987e..230351f3 100644
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
> @@ -105,19 +107,29 @@ static void print_ffs_info(uint32_t toc_offset)
>  
>  	for (i = 0;; i++) {
>  		uint32_t start, size, act, end;
> -		bool ecc;
> +		struct ffs_flags part_flags;
>  		char *name;
>  
> -		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act, &ecc);
> +		rc = ffs_part_info(ffs_handle, i, &name, &start, &size, &act,
> +				&part_flags);

I don't think we can change ffs_part_info() as it is exported in the
shared binary that OpenBMC links against.

So here you could call ffs_entry_user_get() and use the has_flag()
functions - you might need an ffs_entry_get() that returns you an
opaque struct that you can pass to ffs_entry_user_get()...

>  		if (rc == FFS_ERR_PART_NOT_FOUND)
>  			break;
>  		if (rc) {
>  			fprintf(stderr, "Error %d scanning partitions\n", rc);
>  			break;
>  		}
> +
> +		char *flags;
> +		asprintf(&flags, "[%c%c%c%c%c]",
> +		        (part_flags.ecc) ? 'E' : '-',
> +		        (part_flags.preserved) ? 'P' : '-',
> +		        (part_flags.readonly) ? 'R' : '-',
> +		        (part_flags.backup) ? 'B' : '-',
> +		        (part_flags.reprovision) ? 'F' : '-');
> +

Allocations can and do fail :)

>  		end = start + size;
>  		printf("ID=%02d %15s %08x..%08x (actual=%08x) %s\n",
> -		       i, name, start, end, act, ecc ? "[ECC]" : "");
> +		       i, name, start, end, act, flags);
>  
>  		if (strcmp(name, "OTHER_SIDE") == 0)
>  			other_side_offset = start;
> @@ -413,6 +425,51 @@ static void disable_4B_addresses(void)
>  	}
>  }
>  
> +static void print_partition_detail(uint32_t part_ID)
> +{
> +	struct ffs_handle *ffs_handle;
> +	struct ffs_flags part_flags;
> +	int rc;
> +	uint32_t start, size, act, end;
> +	char *name;
> +
> +	rc = ffs_init(0, fl_total_size, bl, &ffs_handle, 0);
> +	if (rc) {
> +		fprintf(stderr, "Error %d opening ffs !\n", rc);
> +		return;
> +	}
> +
> +	rc = ffs_part_info(ffs_handle, part_ID, &name, &start, &size, &act,
> +			&part_flags);
> +	if (rc == FFS_ERR_PART_NOT_FOUND)
> +		return;
> +	if (rc) {
> +		fprintf(stderr, "Error %d scanning partitions\n", rc);
> +		return;
> +	}
> +
> +	ffs_close(ffs_handle);
> +
> +	end = start + size;
> +	printf("ID=%02d - %s %08x..%08x (actual=%08x)\n",
> +		   part_ID, name, start, end, act);
> +
> +	char buf [strlen("ECC,PRESERVED,READONLY,BACKUP,REPROVISION.")];
> +	int l;

asprintf()?

> +	l = snprintf(buf, sizeof(buf), "%s%s%s%s%s",
> +	        (part_flags.ecc) ? "ECC," : "",
> +	        (part_flags.preserved) ? "PRESERVED," : "",
> +	        (part_flags.readonly) ? "READONLY," : "",
> +	        (part_flags.backup) ? "BACKUP," : "",
> +	        (part_flags.reprovision) ? "REPROVISION." : "");
> +	if (l)
> +	    buf[l-1] = '\n';
> +
> +	printf(buf);
> +
> +	return;
> +}
> +
>  static void print_version(void)
>  {
>  	printf("Open-Power Flash tool %s\n", version);
> @@ -494,6 +551,9 @@ static void print_help(const char *pname)
>  	printf("\t\tpartition and then set all the ECC bits as they should be\n\n");
>  	printf("\t-i, --info\n");
>  	printf("\t\tDisplay some information about the flash.\n\n");
> +	printf("\t-m --misc\n");
> +	printf("\t\tDisplays miscellaneous info about a particular partition.\n");
> +	printf("\t\tRequires the numerical partition index as an argument.\n\n");
>  	printf("\t-h, --help\n");
>  	printf("\t\tThis message.\n\n");
>  }
> @@ -508,7 +568,7 @@ void exiting(void)
>  int main(int argc, char *argv[])
>  {
>  	const char *pname = argv[0];
> -	uint32_t address = 0, read_size = 0, write_size = 0;
> +	uint32_t address = 0, read_size = 0, write_size = 0, part_ID = 0;
>  	uint32_t erase_start = 0, erase_size = 0;
>  	bool erase = false, do_clear = false;
>  	bool program = false, erase_all = false, info = false, do_read = false;
> @@ -516,7 +576,7 @@ int main(int argc, char *argv[])
>  	bool show_help = false, show_version = false;
>  	bool no_action = false, tune = false;
>  	char *write_file = NULL, *read_file = NULL, *part_name = NULL;
> -	bool ffs_toc_seen = false, direct = false;
> +	bool ffs_toc_seen = false, direct = false, print_detail = false;
>  	int rc;
>  
>  	while(1) {
> @@ -534,7 +594,7 @@ int main(int argc, char *argv[])
>  			{"program",	required_argument,	NULL,	'p'},
>  			{"force",	no_argument,		NULL,	'f'},
>  			{"flash-file",	required_argument,	NULL,	'F'},
> -			{"info",	no_argument,		NULL,	'i'},
> +			{"info",	no_argument,  		NULL,	'i'},
>  			{"tune",	no_argument,		NULL,	't'},
>  			{"dummy",	no_argument,		NULL,	'd'},
>  			{"help",	no_argument,		NULL,	'h'},
> @@ -547,7 +607,7 @@ int main(int argc, char *argv[])
>  		};
>  		int c, oidx = 0;
>  
> -		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:",
> +		c = getopt_long(argc, argv, "+:a:s:P:r:43Eep:fdihvbtgS:T:cF:m:",
>  				long_opts, &oidx);
>  		if (c == -1)
>  			break;
> @@ -622,6 +682,10 @@ int main(int argc, char *argv[])
>  		case 'c':
>  			do_clear = true;
>  			break;
> +		case 'm':
> +			print_detail = true;
> +			part_ID = strtoul(optarg, NULL, 10);
> +			break;
>  		case ':':
>  			fprintf(stderr, "Unrecognised option \"%s\" to '%c'\n", optarg, optopt);
>  			no_action = true;
> @@ -651,7 +715,7 @@ int main(int argc, char *argv[])
>  	 * also tune them as a side effect
>  	 */
>  	no_action = no_action || (!erase && !program && !info && !do_read &&
> -		!enable_4B && !disable_4B && !tune && !do_clear);
> +		!enable_4B && !disable_4B && !tune && !do_clear && !print_detail);
>  
>  	/* Nothing to do, if we didn't already, print usage */
>  	if (no_action && !show_version)
> @@ -790,17 +854,17 @@ int main(int argc, char *argv[])
>  	/* We have a partition, adjust read/write size if needed */
>  	if (ffsh && ffs_index >= 0) {
>  		uint32_t pstart, pmaxsz, pactsize;
> -		bool ecc;
> +		struct ffs_flags part_flags;
>  		int rc;
>  
>  		rc = ffs_part_info(ffsh, ffs_index, NULL,
> -				   &pstart, &pmaxsz, &pactsize, &ecc);
> +				   &pstart, &pmaxsz, &pactsize, &part_flags);
>  		if (rc) {
>  			fprintf(stderr,"Failed to get partition info\n");
>  			exit(1);
>  		}
>  
> -		if (!ecc && do_clear) {
> +		if (!part_flags.ecc && do_clear) {
>  			fprintf(stderr, "The partition on which to do --clear "
>  					"does not have ECC, are you sure?\n");
>  			check_confirm();
> @@ -871,6 +935,8 @@ int main(int argc, char *argv[])
>  		 */
>  		print_flash_info(flash_side ? 0 : ffs_toc);
>  	}
> +	if (print_detail)
> +		print_partition_detail(part_ID);
>  
>  	/* Unlock flash (PNOR only) */
>  	if ((erase || program || do_clear) && !bmc_flash && !flashfilename) {
> diff --git a/libflash/libffs.c b/libflash/libffs.c
> index 763e061c..a3592521 100644
> --- a/libflash/libffs.c
> +++ b/libflash/libffs.c
> @@ -193,9 +193,12 @@ static struct ffs_entry *ffs_get_part(struct ffs_handle *ffs, uint32_t index)
>  	return NULL;
>  }
>  
> -bool has_ecc(struct ffs_entry *ent)
> +bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG)
>  {
> -	return ((ent->user.datainteg & FFS_ENRY_INTEG_ECC) != 0);
> +    if (FLAG == FFS_ENRY_INTEG_ECC) {
> +        return ((ent_user->datainteg & FFS_ENRY_INTEG_ECC) != 0);
> +    }
> +    return ((ent_user->miscflags & FLAG) != 0);
>  }

Maybe so that you don't need to change everywhere it would have been
nice to have has_ecc() just call has_flag()

>  
>  int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
> @@ -311,7 +314,9 @@ int ffs_init(uint32_t offset, uint32_t max_size, struct blocklevel_device *bl,
>  		if (rc)
>  			goto out;
>  
> -		if (mark_ecc && has_ecc(ent)) {
> +		struct ffs_entry_user ent_user = ffs_entry_user_get(ent);
> +
> +		if (mark_ecc && has_flag(&ent_user, FFS_ENRY_INTEG_ECC)) {
>  			rc = blocklevel_ecc_protect(bl, ent->base, ent->size);
>  			if (rc) {
>  				FL_ERR("Failed to blocklevel_ecc_protect(0x%08x, 0x%08x)\n",
> @@ -364,9 +369,11 @@ int ffs_lookup_part(struct ffs_handle *ffs, const char *name,
>  
>  int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  		  char **name, uint32_t *start,
> -		  uint32_t *total_size, uint32_t *act_size, bool *ecc)
> +		  uint32_t *total_size, uint32_t *act_size,
> +		  struct ffs_flags *part_flags)
>  {
>  	struct ffs_entry *ent;
> +	struct ffs_entry_user ent_user;
>  	char *n;
>  
>  	ent = ffs_get_part(ffs, part_idx);
> @@ -379,8 +386,17 @@ int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  		*total_size = ent->size;
>  	if (act_size)
>  		*act_size = ent->actual;
> -	if (ecc)
> -		*ecc = has_ecc(ent);
> +
> +	if (part_flags)
> +	{
> +        ent_user = ffs_entry_user_get(ent);
> +        part_flags->ecc = has_flag(&ent_user, FFS_ENRY_INTEG_ECC);
> +        part_flags->preserved = has_flag(&ent_user, FFS_MISCFLAGS_PRESERVED);
> +        part_flags->readonly = has_flag(&ent_user, FFS_MISCFLAGS_READONLY);
> +        part_flags->backup = has_flag(&ent_user, FFS_MISCFLAGS_BACKUP);
> +        part_flags->reprovision =
> +                has_flag(&ent_user, FFS_MISCFLAGS_REPROVISION);
> +	}
>  
>  	if (name) {
>  		n = calloc(1, FFS_PART_NAME_MAX + 1);
> @@ -546,6 +562,19 @@ int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int sid
>  	return rc;
>  }
>  
> +struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry)
> +{
> +    struct ffs_entry_user entry_user;
> +
> +    entry_user.chip = entry->user.chip;
> +    entry_user.compresstype = entry->user.compresstype;
> +    entry_user.datainteg = entry->user.datainteg;
> +    entry_user.vercheck = entry->user.vercheck;
> +    entry_user.miscflags = entry->user.miscflags;
> +
> +    return entry_user;
> +}

Why not expose this function outside the library - struct
ffs_entry_user is already exposed.

> +
>  /* This should be done last! */
>  int ffs_hdr_create_backup(struct ffs_hdr *hdr)
>  {
> diff --git a/libflash/libffs.h b/libflash/libffs.h
> index 2c1fbd83..d5c6a486 100644
> --- a/libflash/libffs.h
> +++ b/libflash/libffs.h
> @@ -24,6 +24,7 @@ struct ffs_handle;
>  struct ffs_hdr;
>  struct ffs_entry;
>  struct ffs_entry_user;
> +struct ffs_flags;
>  
>  /**
>   * struct ffs_entry_user - User data entries
> @@ -44,6 +45,14 @@ struct ffs_entry_user {
>  	uint8_t miscflags;
>  };
>  
> +struct ffs_flags {
> +	bool ecc;
> +	bool preserved;
> +	bool readonly;
> +	bool backup;
> +	bool reprovision;
> +};

So, literally just above there there is struct ffs_entry_user, which is
there to solve this exact problem - why do we need another struct?

> +
>  /* Error codes:
>   *
>   * < 0 = flash controller errors
> @@ -90,7 +99,7 @@ struct ffs_entry_user {
>  #define FFS_MISCFLAGS_REPROVISION 0x10
>  
>  
> -bool has_ecc(struct ffs_entry *ent);
> +bool has_flag(struct ffs_entry_user *ent_user, uint16_t FLAG);
>  
>  /* Init */
>  
> @@ -124,7 +133,8 @@ int ffs_lookup_part(struct ffs_handle *ffs, const char *name,
>  
>  int ffs_part_info(struct ffs_handle *ffs, uint32_t part_idx,
>  		  char **name, uint32_t *start,
> -		  uint32_t *total_size, uint32_t *act_size, bool *ecc);
> +		  uint32_t *total_size, uint32_t *act_size,
> +		  struct ffs_flags *part_flags);
>  
>  int ffs_update_act_size(struct ffs_handle *ffs, uint32_t part_idx,
>  			uint32_t act_size);
> @@ -140,6 +150,8 @@ int ffs_entry_user_set(struct ffs_entry *ent, struct ffs_entry_user *user);
>  
>  int ffs_entry_add(struct ffs_hdr *hdr, struct ffs_entry *entry, unsigned int side);
>  
> +struct ffs_entry_user ffs_entry_user_get(struct ffs_entry *entry);
> +

Oh re my previous comment about exposing ffs_entry_user_get()... so why
not call it in pflash?

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
> index 00000000..f4b6eb0a
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
> +pass=true
> +wd=$(dirname -- "$0")
> +
> +xxd -p -r "$wd/test-miscprint.pnor" > "$wd/temp.pnor"
> +
> +output=$(pflash -m 1 -F "$wd/temp.pnor")
> +if [[ $output != "PRESERVED" ]]; then
> +    pass=false
> +fi
> +
> +output=$(pflash -m 2 -F "$wd/temp.pnor")
> +if [[ $output != "READONLY" ]]; then
> +    pass=false
> +fi
> +
> +output=$(pflash -m 3 -F "$wd/temp.pnor")
> +if [[ $output != "REPROVISION" ]]; then
> +    pass=false
> +fi
> +
> +output=$(pflash -m 4 -F "$wd/temp.pnor")
> +if [[ $output != "BACKUP" ]]; then
> +    pass=false
> +fi
> +
> +if [[ pass ]]; then
> +    echo "Test passed!"
> +else
> +    echo "Test failed!"
> +fi
> +
> +rm "$wd/temp.pnor"
