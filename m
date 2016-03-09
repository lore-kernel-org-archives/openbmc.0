Return-Path: <cyrilbur@gmail.com>
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id EFE931A009D
 for <openbmc@lists.ozlabs.org>; Wed,  9 Mar 2016 13:31:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b=zQh9qOcz; 
 dkim-atps=neutral
Received: by mail-pf0-x242.google.com with SMTP id 184so2436207pff.1
 for <openbmc@lists.ozlabs.org>; Tue, 08 Mar 2016 18:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uUU3bz4g/ShdE80lh7w2R1HZVd6f90A5dyWJRHT7Ojo=;
 b=zQh9qOczm5ceyCXQFWp7QM5Fi3AJBWfi/qTRna5vnQVdCnfJiE57gv+wStyg8PggfH
 fXrSfZjXKtnn42+5wWBw/M7bDoZuOrFMQPzezMK2k0RaS6nTVkC6pLGhTovS0am+4OlO
 /JU6Aucg2ebtUuafkWEETlVvfORpdPEWu0W0I0t9WbVLxBN2HZ6dPY0KwV/oGXAaI9/b
 YxhWzn9s9fIhdZbw/TaXwZ+eINV0xlEunfbJOEDJ5ru3RoyravwcGwmY3zu6iXtr3oJl
 PRGWqO187ykfWtsKksdco5V6AKfh+v1Iz+kcrsNTYeVowHptN4YLY6aCQXJ3tku+yWSH
 ky6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uUU3bz4g/ShdE80lh7w2R1HZVd6f90A5dyWJRHT7Ojo=;
 b=dV8KIweCJfYxAM/ITFyK1Xp6S5jfKgbAuyPZHvrE3jvUBo3wpccxbhMenJDRAmDdsT
 8UFZucdPdpJGwKuJPUXAYcklHuJjopNOqO6hlu3HAesuOX11Q46Ls+KhzyBz5ycM3g7V
 OUP94cmDxvwVvZtJOlmPlFSyvZ2eLecKq8qYqYFIWc4zmRNPUCAvxC6yd2S+AsWD4vgj
 KOJpwSEBkiQtO6SLq3fwoWdudqHcicaw/Ltq9x450sPdyiDEedK8dnhrko9S/gawzKoS
 K68egcDHHanMhb6ZPdNXiEgMt7nzawHMr1bzORlGvx+X54i+i6Jby0Ho9vpW2miLB16L
 ZO/g==
X-Gm-Message-State: AD7BkJLhrUcLd5IaO3mpz2BSSpH6L+QDsTvxPb6MHKGCNci2+9TBsQcr+nz2yEFe0Yy/Sw==
X-Received: by 10.98.67.67 with SMTP id q64mr47362911pfa.44.1457490691552;
 Tue, 08 Mar 2016 18:31:31 -0800 (PST)
Received: from camb691 ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id cz5sm7884607pac.30.2016.03.08.18.31.29
 (version=TLSv1/SSLv3 cipher=OTHER);
 Tue, 08 Mar 2016 18:31:31 -0800 (PST)
Date: Wed, 9 Mar 2016 13:31:23 +1100
From: Cyril Bur <cyrilbur@gmail.com>
To: OpenBMC Patches <openbmc-patches@stwcx.xyz>
Cc: openbmc@lists.ozlabs.org, tomjose <tomjoseph@in.ibm.com>
Subject: Re: [PATCH phosphor-host-ipmid] ipmi daemon return code modification
Message-ID: <20160309133123.5d11a1ea@camb691>
In-Reply-To: <1457467833-17690-2-git-send-email-openbmc-patches@stwcx.xyz>
References: <1457467833-17690-1-git-send-email-openbmc-patches@stwcx.xyz>
 <1457467833-17690-2-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: Claws Mail 3.13.2 (GTK+ 2.24.29; x86_64-unknown-linux-gnu)
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
X-List-Received-Date: Wed, 09 Mar 2016 02:31:35 -0000

On Tue,  8 Mar 2016 14:10:33 -0600
OpenBMC Patches <openbmc-patches@stwcx.xyz> wrote:

> From: tomjose <tomjoseph@in.ibm.com>
> 
> ---
>  apphandler.C | 2 +-
>  ipmid.C      | 1 -
>  2 files changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/apphandler.C b/apphandler.C
> index a921643..fc6c811 100644
> --- a/apphandler.C
> +++ b/apphandler.C
> @@ -358,7 +358,7 @@ ipmi_ret_t ipmi_app_channel_info(ipmi_netfn_t netfn, ipmi_cmd_t cmd,
>      printf("IPMI APP GET CHANNEL INFO\n");
>  
>      // I"m only supporting channel 1.  0xE is the 'default channel'
> -    if (*p == 0xe || *p == 1) {
> +    if (*p == 0xe || *p == 1 || *p == 8) {
>  

So I take it that the comment is no longer valid? Can we take a break on magic
numbers or at least quote and link the spec nearby?

>          *data_len = sizeof(resp);
>          memcpy(response, resp, *data_len);
> diff --git a/ipmid.C b/ipmid.C
> index 6726a27..728ba0b 100644
> --- a/ipmid.C
> +++ b/ipmid.C
> @@ -267,7 +267,6 @@ static int handle_ipmi_command(sd_bus_message *m, void *user_data, sd_bus_error
>      if(r != 0)
>      {
>          fprintf(stderr,"ERROR:[0x%X] handling NetFn:[0x%X], Cmd:[0x%X]\n",r, netfn, cmd);
> -        return -1;
>      }

Was this change intended?

>  
>      fprintf(ipmiio, "IPMI Response:\n");
