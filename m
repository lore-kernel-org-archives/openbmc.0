Return-Path: <jk@ozlabs.org>
Received: from ozlabs.org (ozlabs.org [103.22.144.67])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3rJ5k112RXzDq80
 for <openbmc@lists.ozlabs.org>; Mon, 30 May 2016 16:07:05 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPSA id 3rJ5k06CtBz9t6Z;
 Mon, 30 May 2016 16:07:04 +1000 (AEST)
Subject: Re: [PATCH openpower-host-ipmi-oem v3] Fix issue5 for endian safe
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
References: <20160527120039.11133-1-openbmc-patches@stwcx.xyz>
 <20160527120039.11133-2-openbmc-patches@stwcx.xyz>
From: Jeremy Kerr <jk@ozlabs.org>
Cc: Nan Li <bjlinan@cn.ibm.com>
Message-ID: <574BD883.7030004@ozlabs.org>
Date: Mon, 30 May 2016 14:06:59 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20160527120039.11133-2-openbmc-patches@stwcx.xyz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.22
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Mon, 30 May 2016 06:07:05 -0000

Hi Nan,

> @@ -29,9 +30,8 @@ ipmi_ret_t ipmi_ibm_oem_partial_esel(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>  	esel_request_t *reqptr = (esel_request_t*) request;
>  	FILE *fp;
>  	int r = 0;
> -	// TODO: Issue 5: This is not endian-safe.
> -	short *recid  =  (short*) &reqptr->selrecordls;
> -	short *offset =  (short*) &reqptr->offsetls;
> +	short recid  =  le16toh((((unsigned short) reqptr->selrecordms) << 8) + reqptr->selrecordls);
> +	short offset =  le16toh((((unsigned short) reqptr->offsetms) << 8) + reqptr->offsetls);

I think that this is less correct than the first attempt, and that's
probably due to an incorrect suggestion from me. Sorry for that.

I've only just noticed that you're using different members of the reqptr
struct to construct that 16-bit value; so your first patch probably did
the right thing.

However: we should fix the actual source of the problem - that the
fields in struct esel_request_t are unnecessarily split into uint8_t
fields.

I think it'd be much better if we changed esel_request_t to this:

  struct esel_request_t {
      uint16_t  resid;
      uint16_t  selrecord;
      uint16_t  offset;
      uint8_t  progress;
  }  __attribute__ ((packed)) ;

- and did the proper conversion with le16toh().

[Also, the typo in the commit title is still present]

Regards,


Jeremy
