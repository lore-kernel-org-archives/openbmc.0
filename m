Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x244.google.com (mail-pf0-x244.google.com
 [IPv6:2607:f8b0:400e:c00::244])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3qPGft628tzDq7K
 for <openbmc@lists.ozlabs.org>; Tue, 15 Mar 2016 12:07:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=NdjGt63u; 
 dkim-atps=neutral
Received: by mail-pf0-x244.google.com with SMTP id n5so375358pfn.1
 for <openbmc@lists.ozlabs.org>; Mon, 14 Mar 2016 18:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pOHPfX8M4/M3A/1k3nxPtBHFt5dhWqjKm4XlUzosKXg=;
 b=NdjGt63uYBXEe3JXfFI+Z3+JsoWM94vW0rL8NnRli1FK4T+DjzCcyEMMVTlM9UyDfl
 XZaLCigi4Jov7zNE5MhC9f7rEGTYsRFGniiNJhxXu02w3qHtDWUkY2dH9A396ABbjNxg
 08CtgbbpY6vRrS2vgXA21sQi/ZA2LcyQiwS702UbRc+ewHshiy+a0xmXF0Irv8VWPHyW
 BVTowccB4H0I8/SRAKRkEOxN1ZZ6dR6Cl+KG74uRGtEcc/M299OvX2e9UWqfFRMw/FY8
 PFYnbXmGPhA5AuwVbR5KS1czyMibFHxT/4uPARv60l4pmPhUfUZ98PGxssmZePS+kOrS
 +JCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pOHPfX8M4/M3A/1k3nxPtBHFt5dhWqjKm4XlUzosKXg=;
 b=gfkCBdO7wf29jzxMovln1Hd1Q9wMJygm9fhDERUYeB6SzZjWDD57QcRMtv/NnjRabq
 XOj8aAE3gj67OI+EBiAIiBaI2crPfIrD5DpCs49QtmBuTgze6FKINGQYULZIuZUngGJa
 MxK6t5EignhVrxwp02QficYaAt06hefE247t0i91w4ZMzwoS+8m4ZX6Vwv0to0UDXNsu
 W/9jLeaLLgo34Hzqm45g751a5uG2Fr0ZVZmFlyhpwEic3vbavzDna8oDpX0g+TX5Th2J
 XI+X/QA2Bm9f0szwHakg+OAfxFfKPnCyttRH7AlXqtH0bvnE4AGPmdOWmiZNo0eYXJh/
 7e8Q==
X-Gm-Message-State: AD7BkJLCjsbHgyQTG2c2txXgDkqLiWkNHgDjoSSX/29iUlpGemFeb2i02xAJZfQMYPdsUg==
X-Received: by 10.66.190.229 with SMTP id gt5mr42692319pac.118.1458004021014; 
 Mon, 14 Mar 2016 18:07:01 -0700 (PDT)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id n28sm34867686pfa.45.2016.03.14.18.06.58
 (version=TLSv1/SSLv3 cipher=OTHER);
 Mon, 14 Mar 2016 18:07:00 -0700 (PDT)
Date: Tue, 15 Mar 2016 12:06:51 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: austenc@us.ibm.com
Cc: OpenBMC Patches <openbmc-patches@stwcx.xyz>, openbmc@lists.ozlabs.org
Subject: Re: [PATCH phosphor-event v4 2/2] Fixed Multiple associations
 occasionally geting truncated
Message-ID: <20160315120651.764f393c@camb691>
In-Reply-To: <1457736030-6801-3-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457736030-6801-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457736030-6801-3-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.30; x86_64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
X-List-Received-Date: Tue, 15 Mar 2016 01:07:03 -0000

On Fri, 11 Mar 2016 16:40:30 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: Chris Austen <austenc@us.ibm.com>
> 
> After additional testing it was found that the association list gets truncated
> leaving you with only one item.  Upon code review it was realized that the
> use of strtok manipulated a cached string and tokenized the string with NULLs.
> 
> Changed to use a temp buffer for strtok to manipulate and switched to
> strtok_r since it is a best practice to ensure things are thread safe.

Oh ok, I get v4 now. Since you introduce this code in the previous patch, these
fixes should be squashed into the previous patch. Reason for this is that each
patch should leave the repository in a state where it works. Of course as it
often happens bugs get found after code is added, this is the reason for fix
patches.

And as stated in my response to 1/2, this is a perfect candidate for the
changelog I was talking about.

Few problems with the patch though.

> ---
>  event_messaged_sdbus.c | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/event_messaged_sdbus.c b/event_messaged_sdbus.c
> index 907ac53..ff9fd5e 100644
> --- a/event_messaged_sdbus.c
> +++ b/event_messaged_sdbus.c
> @@ -99,7 +99,7 @@ static int prop_message_assoc(sd_bus *bus,
>  	messageEntry_t *m = (messageEntry_t*) userdata;
>  	event_record_t *rec;
>  	char *p;
> -	char *token;
> +	char *token, *saveptr;
>  
>  	rec = message_record_open(m->em, m->logid);
>  	if (!rec) {
> @@ -110,9 +110,13 @@ static int prop_message_assoc(sd_bus *bus,
>  		return -1;
>  	}
>  
> -	p = rec->association;
> +	/* strtok manipulates a string.  That means if any caching was done   */
> +	/* then the original string would get messed up.  To avoid that since */
> +	/* I know there is caching done simple make a copy and mess with that */

I think I see what you're trying to say here but the word caching is... odd.

> +	asprintf(&p, "%s", rec->association);

How about:
p = strdup(rec->association);

It was designed for your use case :).

Few other notes, should probably check the return value of either strdup or
asprintf to make sure p was actually allocated.

In the case of using strdup it might not be disastrous if strtok handles being
passed NULL (I worry it won't though), however, in the case of asprintf, since
it doesn't say anything about the value of p if it returns -1 then bad things
are likely to happen upon passing that to strtok.

Also, can you know the maximal possible size of association here? I would feel
safer using strndup().

One more thing, why did you change to using strtok_r()? According to the
manpage, they do the same thing except that strtok() isn't thread safe, do you
care though, this isn't multi threaded in any way is it?

Thanks,

Cyril

> +
> +	token = strtok_r(p, " ", &saveptr);
>  
> -	token = strtok(p, " ");
>  	if (token) {
>  		r = sd_bus_message_open_container(reply, 'a', "(sss)");
>  		if (r < 0) {
> @@ -120,18 +124,19 @@ static int prop_message_assoc(sd_bus *bus,
>  		}
>  
>  		while(token) {
> -
>  			r = sd_bus_message_append(reply, "(sss)", "fru", "event", token);
>  			if (r < 0) {
>  				fprintf(stderr,"Error adding properties for %s to reply %s\n", token, strerror(-r));
>  			}
>  
> -			token = strtok(NULL, " ");
> +			token = strtok_r(NULL, " ", &saveptr);
>  		}
>  
>  		r = sd_bus_message_close_container(reply);
>  	}
>  
> +	free(p);
> +
>  	return r;
>  }
>  
