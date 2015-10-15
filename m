Return-Path: <joel.stan@gmail.com>
Received: from mail-oi0-x230.google.com (mail-oi0-x230.google.com
 [IPv6:2607:f8b0:4003:c06::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 7BF6D1A05AA
 for <openbmc@lists.ozlabs.org>; Thu, 15 Oct 2015 13:26:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=hF0wCeWb; 
 dkim=pass (1024-bit key;
 unprotected) header.d=jms.id.au header.i=@jms.id.au header.b=fNg6XkdW; 
 dkim-atps=neutral
Received: by oiak8 with SMTP id k8so38669685oia.1
 for <openbmc@lists.ozlabs.org>; Wed, 14 Oct 2015 19:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=yOd0zRJaHn8WXAjIYr3pVsixN/kYlCakK3AkuBYNBoc=;
 b=hF0wCeWb5b0dVDAL7nIsgW6aVKkbCGO4R+GDHwIaijmyBkl38vKoyMo6eieNmdAwrs
 7Hyho1lYjbmcVziWgn1NE2rNK5Y9XxBKppqwXG7ZSGaOF7NGKETlMgss+RbkzupbItur
 84OHbR58unQi9CckqxfZSYqSzhfqCMqmvC+wNUptQb67L+Fv+62bKGGtXmcomMUmA3om
 /WKVVm0lJWbCLMqaurXyuA+rB94etxDYgy3XHBNXbVsI3nPPSVjy1/2vAIMlh/fW9nEu
 W05qU4eJZUgBtZeVSmp/LeXtAn0Mj4TXqjmlQZ93VH4GMJ4YybykmmnkbYkNj6l2yMbG
 Ehhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:sender:in-reply-to:references:from:date:message-id
 :subject:to:cc:content-type;
 bh=yOd0zRJaHn8WXAjIYr3pVsixN/kYlCakK3AkuBYNBoc=;
 b=fNg6XkdWXhnT1PeOxYt1dl79ZotQATTVUwRmGRzNYG2fgbDvaY0IyClCoPUrQpCD1Y
 3X6EV3GKPl9316a04VVDiJNSL+otWF2F4CShJGsY/bVcq2wmz/aj7Tf4kZ54OAAirI9Q
 9o9D/qZUS5qPUAGBKSDHOMdoZ8F7MuN6aGpJo=
X-Received: by 10.202.72.74 with SMTP id v71mr3994262oia.124.1444876002220;
 Wed, 14 Oct 2015 19:26:42 -0700 (PDT)
MIME-Version: 1.0
Sender: joel.stan@gmail.com
Received: by 10.202.182.197 with HTTP; Wed, 14 Oct 2015 19:26:22 -0700 (PDT)
In-Reply-To: <1444832615-18343-2-git-send-email-patches@stwcx.xyz>
References: <1444832615-18343-1-git-send-email-patches@stwcx.xyz>
 <1444832615-18343-2-git-send-email-patches@stwcx.xyz>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 15 Oct 2015 12:56:22 +1030
X-Google-Sender-Auth: J7hoDPmN9OM7sbXCY7F6sIDxp98
Message-ID: <CACPK8XeWcE1QjU74kTcTBjA0Co_DPhP-u+LpK6k753JDKwB22Q@mail.gmail.com>
Subject: Re: [PATCH phosphor-host-ipmid] FRU validator CLI
To: OpenBMC Patches <patches@stwcx.xyz>, vishwanath@in.ibm.com
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Thu, 15 Oct 2015 02:26:45 -0000

On Thu, Oct 15, 2015 at 12:53 AM, OpenBMC Patches <patches@stwcx.xyz> wrote:
> From: vishwabmc <vishwanath@in.ibm.com>
>
> ---
>  fruvalidator.C | 252 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 252 insertions(+)
>  create mode 100644 fruvalidator.C
>
> diff --git a/fruvalidator.C b/fruvalidator.C

Is this C or C++?  The code all looks like C, but I assume your .C
extension means you want to compile it as C++. I suggest making it C,
unless we have a good reason to be C++.

> new file mode 100644
> index 0000000..5e2ffaf
> --- /dev/null
> +++ b/fruvalidator.C
> @@ -0,0 +1,252 @@
> +#include <stdio.h>
> +#include <string.h>
> +#include <sys/stat.h>
> +
> +typedef unsigned char uint8_t;

Use #include <stdint.h> instead of creating your own typedef.

> +
> +/*
> + * --- For Reference.----

Lose the ---, and add the * to each line of the block comment below.

> +typedef struct

struct commond_header, no need to typedef.

> +{
> +    uint8_t fixed;
> +    uint8_t internal_offset;
> +    uint8_t chassis_offset;
> +    uint8_t board_offset;
> +    uint8_t product_offset;
> +    uint8_t multi_offset;
> +    uint8_t pad;
> +    uint8_t crc;
> +}common_header_t;
> +*/
> +
> +#define HDR_BYTE_ZERO   1
> +#define INTERNAL_OFFSET 1
> +#define HDR_CRC_OFFSET  7

If you uncomment your struct definition you can do offsetof(struct
header, crc) instead of these #defines. This eliminates any errors you
may have if someone changes the header and forgets to change the
#define.

> +#define COMMON_HDR_SIZE 8

If you uncomment your struct definition, you can use sizeof(struct
common_header).

> +#define RECORD_NOT_PRESENT 0
> +#define EIGHT_BYTES 8

Not necessary.

> +uint8_t common_hdr[COMMON_HDR_SIZE] = {0};
> +
> +//------------------------------------------------
> +// Takes the pointer to stream of bytes and length
> +// returns the 8 bit checksum per IPMI spec.
> +//--------------------------------------------------

You've switched from C-style comments to C++ style. I think if you're
writing C, you should use C-style ( /*  foo */ ).

> +unsigned char calculate_checksum(unsigned char *ptr, int len)
> +{
> +    // REFER :: http://coreipm.googlecode.com/svn-history/r40/trunk/coreipm/ipmi_pkt.c
> +    char checksum = 0;
> +    int byte = 0;
> +
> +    for(byte = 0; byte < len; byte++)
> +    {
> +        checksum += *ptr++;
> +    }
> +
> +    return( -checksum );
> +}
> +
> +//---------------
> +// Display Usage
> +//---------------

This comment is unnecessary.

> +void usage(char *binary)
> +{
> +    printf("Usage: %s <valid binary ipmi fru file>\n", binary);
> +    return;

The return is unnecessary.

> +}
> +
> +//-----------------------------------------------------
> +// Accepts the filename and validated per IPMI FRU spec
> +//------------------------------------------------------

Fix the comments.

> +bool validate_fru_record(char *fru_file_name)

const char *?

> +{
> +    // Used for generic checksum calculation.

Comment style.

> +    uint8_t checksum = 0;
> +
> +    // This can point to

This sentence is incomplete.

> +    uint8_t fru_section;
> +
> +    // A generic offset locator for any FRU record.
> +    uint8_t record_offset = 0;
> +
> +    // Number of bytes read from FRU file.

Unnecessary.

> +    size_t bytes_read = 0;
> +
> +    // First 2 bytes in the record.
> +    uint8_t fru_record_hdr[2] = {0};

Unnecessary.

> +
> +    //common_header_t com_hdr;
> +    memset(common_hdr, 0x0, sizeof(common_hdr));

I suggest you restructure this code to use an instance of the struct
common_header, instead of an array of bytes.

> +
> +    // For now, this is user supplied in CLI. But this will be a parameter from
> +    // fru handler
> +    FILE *fru_file = fopen(fru_file_name,"rb");
> +    if(fru_file == NULL)
> +    {
> +        fprintf(stderr, "ERROR: opening:[%s]\n",fru_file_name);
> +        return false;
> +    }
> +
> +    // Read first 8 bytes into common_header so we know the offsets and hdr
> +    // checksum.
> +    fseek(fru_file, 0, SEEK_SET);
> +    bytes_read = fread(common_hdr, sizeof(common_hdr), 1, fru_file);
> +    if(bytes_read != 1)
> +    {
> +        fprintf(stderr, "ERROR reading common header. Bytes read=:[%ld]\n",bytes_read);
> +        return false;
> +    }
> +
> +    // 1: Validate for first byte to always have a value of [1]
> +    if(common_hdr[0] != HDR_BYTE_ZERO)
> +    {
> +        fprintf(stderr, "ERROR: Common Header entry_1:[0x%X] Invalid.\n",common_hdr[0]);
> +        return false;
> +    }
> +    else
> +    {
> +        printf("SUCCESS: Validated [0x%X] in common header\n",common_hdr[0]);
> +    }
> +
> +    // 2: Validate the header checskum that is at last byte ( Offset: 7 )
> +    checksum = calculate_checksum(common_hdr, sizeof(common_hdr)-1);
> +    if(checksum != common_hdr[HDR_CRC_OFFSET])
> +    {
> +        fprintf(stderr, "ERROR: Common Header checksum mismatch."
> +                " Calculated:[0x%X], Embedded:[0x%X]\n",
> +                checksum, common_hdr[HDR_CRC_OFFSET]);
> +
> +        return false;
> +    }
> +    else
> +    {
> +        printf("SUCCESS: Common Header checksum MATCH:[0x%X]\n",checksum);
> +    }
> +
> +    // !! FIXME FIXME FIXME FIXME
> +    // This below logic fails if the record type is "Multi". I however have not
> +    // seen a usecase of that in FRU inventory.. But, if I need to fix, its
> +    // easy.
> +    // !! FIXME FIXME FIXME FIXME
> +
> +    // 3: Now start walking the common_hdr array that has offsets into other FRU
> +    //    record areas and validate those. Starting with second entry since the
> +    //    first one is always a [0x01]
> +    for(fru_section = INTERNAL_OFFSET ; fru_section < (COMMON_HDR_SIZE - 2)  ; fru_section++)
> +    {
> +        // Offset is 'value given in' internal_offset * 8 from the START of
> +        // common header. So an an example, 01 00 00 00 01 00 00 fe has
> +        // product area set at the offset 01 * 8 --> 8 bytes from the START of
> +        // common header. That means, soon after the header checksum.
> +        record_offset = common_hdr[fru_section] * EIGHT_BYTES;
> +
> +        if(record_offset)
> +        {
> +            // A NON zero value means that the vpd packet has the data for that
> +            // section.  These are the things needed at this moment:
> +
> +            // 1: Goto beginning of the FILE
> +            rewind(fru_file);
> +
> +            // 2: Move the file pointer to record_offset
> +            fseek(fru_file, record_offset, SEEK_SET);
> +
> +            // 3: Read first 2 bytes containing FIXED[0x1] and record Length.
> +            fread(fru_record_hdr, sizeof(fru_record_hdr), 1, fru_file);
> +
> +            // 5: If first element in the record header is _not_ a fixed:[0x01], err out.
> +            if(fru_record_hdr[0] != HDR_BYTE_ZERO)
> +            {
> +                fprintf(stderr, "ERROR: Unexpected :[0x%X] found at Record header",
> +                        fru_record_hdr[0]);
> +
> +                return false;
> +            }
> +            else
> +            {
> +                printf("SUCCESS: Validated [0x%X] in fru record:[%d] header\n",
> +                        fru_record_hdr[0],fru_section);
> +            }
> +
> +            // 4: Read Length bytes ( makes a complete record read now )
> +            uint8_t fru_record_len = fru_record_hdr[1] * EIGHT_BYTES;
> +
> +            printf("RECORD NO[%d], SIZE = [%d] \n",fru_section, fru_record_len);
> +
> +            uint8_t fru_record_data[fru_record_len];
> +            memset(fru_record_data, 0x0, sizeof(fru_record_data));
> +
> +            // Since the data is from record data[0], move the file pointer again to
> +            // beginning of record.
> +            fseek(fru_file, -2, SEEK_CUR);
> +            fread(fru_record_data, sizeof(fru_record_data), 1, fru_file);
> +
> +            // 5: Calculate checksum (from offset -> (Length-1)).
> +            //    All the bytes except the last byte( which is CRC :) ) will
> +            //    participate in calculating the checksum.
> +            checksum = calculate_checksum(fru_record_data, sizeof(fru_record_data)-1);
> +
> +            // 6: Verify the embedded checksum in last byte with calculated checksum
> +            //    record_len -1 since length is some N but numbering is 0..N-1
> +            if(checksum != fru_record_data[fru_record_len-1])
> +            {
> +                fprintf(stderr, "ERROR: FRU Header checksum mismatch. "
> +                        " Calculated:[0x%X], Embedded:[0x%X]\n",
> +                        checksum, fru_record_data[fru_record_len-1]);
> +
> +                return false;
> +            }
> +            else
> +            {
> +                printf("SUCCESS: FRU Header checksum MATCH:[0x%X]\n",checksum);
> +            }
> +
> +            // 7: If everything is okay, then we are fine.. Else mostly we are
> +            //    awaiting another FRU write -OR- worst case, the VPD is corrupted
> +            //    over BT.
> +        } // If the packet has data for a particular data record.
> +    } // End walking all the fru records.
> +
> +    return true;
> +}
> +
> +//---------------------------------------------------------------------
> +// Main function but this will be integrated as a API for
> +// Open BMC code that accepts a filename and returns success or failure
> +//----------------------------------------------------------------------
> +int main(int argc, char *argv[])
> +{
> +    // Right way is to do a parse_opt but that is poky for now.
> +    if(argc != 2)
> +    {
> +        usage(argv[0]);
> +        return -1;
> +    }
> +
> +    // Check if this file is really present.
> +    struct stat statbuff;
> +    if(stat(argv[1], &statbuff) == -1)
> +    {
> +        usage(argv[0]);
> +        return -1;
> +    }
> +    else if(statbuff.st_mode & S_IFMT != S_IFREG)
> +    {
> +        usage(argv[0]);
> +        return -1;
> +    }
> +
> +    bool scan_result = validate_fru_record(argv[1]);
> +    if(scan_result == true)
> +    {
> +        printf("SUCCESS: Validated:[%s]\n",argv[1]);
> +    }
> +    else
> +    {
> +        printf("ERROR: Validation failed for:[%s]\n",argv[1]);
> +        return -1;
> +    }
> +
> +    return 0;
> +}
> --
> 2.6.0
>
>
> _______________________________________________
> openbmc mailing list
> openbmc@lists.ozlabs.org
> https://lists.ozlabs.org/listinfo/openbmc
