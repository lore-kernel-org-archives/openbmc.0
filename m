Return-Path: <eric.dumazet@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::243; helo=mail-pf0-x243.google.com;
 envelope-from=eric.dumazet@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="aHTKjkb5"; 
 dkim-atps=neutral
Received: from mail-pf0-x243.google.com (mail-pf0-x243.google.com
 [IPv6:2607:f8b0:400e:c00::243])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 40xLlB6kKWzDr30
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 18:50:27 +1000 (AEST)
Received: by mail-pf0-x243.google.com with SMTP id a14-v6so10451359pfi.1
 for <openbmc@lists.ozlabs.org>; Thu, 31 May 2018 01:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G3Z75WRH03cy/sis3Q1mtSYEYWOJL6GZiYMlbFfI01c=;
 b=aHTKjkb5H7RkE6CiwgFjy3LY4cBD0mMa62N2sss28SVvOEpeKpkQZ4RS708Hvht2TG
 bw/HGTDQyfH4+TGsU4p7brI15KkWJ9eBUnsoWhW9vvYZsZ9TPwAbf/4pEWiXi6WAvG7w
 CGcgDSHbewWnMRwBaKoUkBFlgHfuD5I29yEacBVmWsvWVso6JSnzobhJwyjNCppPB3Od
 NdPMydG1M4QSoaNcJ+h4LiOag+wbAblJGPp03Y7+d+wFgxYUiRhREM4W+iZF32zdem6R
 O0wu56cI2Tza2F8xwxbQSWAtsMcugrQlzyXCvzBtCKiyi9BcwnwCoKLhW96I4wyKBSUr
 lPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G3Z75WRH03cy/sis3Q1mtSYEYWOJL6GZiYMlbFfI01c=;
 b=IGH9DOZH3oKV219kIfSGm1s9CwV2Fnqgtuyo5zLl4glPhZlV7I5XVspD9UDGRxftWC
 NUheCFgnhrYIHUWTZ+vdfU2GdKigyRqmO9Rgt7cFH4HP+6uysI5Px9WjjE5Pq3ESyNCN
 jXQ0m0zwWcn0m2GNPy5qOQz8n/Dx0tKDkQDQMorufA4xxCeg5nOsBeip93K7A40vK8ZR
 QdRUcEvj6gFIj5BaCmd13k+ycmUalOqh+k+BkxwRwslzjSqX+hQ7Bi75Q4hwsWbN4vhC
 MNsDYxpUN5bYFFSWuyifDQ8pJaIHbcvlgHJa96GYgKoKbMcFjOhj0DmdbJE6BPDyLCMk
 M1Vw==
X-Gm-Message-State: ALKqPwcWwBlo+XEAeICSkz4K2QubBr4jxcUtbCiypyw17/JQowd4aDY8
 56uGVgXyhMtTKIfxFB8Dy6btjtui
X-Google-Smtp-Source: ADUXVKIKu4W7UCIdmRYGLWi9z2ODkxcAbJu+WmCYtA3hDASYwslNe++F59i54tU3ubgCTFqDAatHvQ==
X-Received: by 2002:a63:b008:: with SMTP id
 h8-v6mr3329768pgf.137.1527756623811; 
 Thu, 31 May 2018 01:50:23 -0700 (PDT)
Received: from [10.246.221.134] ([50.234.174.228])
 by smtp.gmail.com with ESMTPSA id d6-v6sm6283852pgc.38.2018.05.31.01.50.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 May 2018 01:50:23 -0700 (PDT)
Subject: Re: [PATCH net-next] net/ncsi: Avoid GFP_KERNEL in response handler
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>, netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org
References: <20180531070254.28878-1-sam@mendozajonas.com>
From: Eric Dumazet <eric.dumazet@gmail.com>
Message-ID: <69fcb143-00a2-2ddf-e2d4-c692b650f292@gmail.com>
Date: Thu, 31 May 2018 04:50:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180531070254.28878-1-sam@mendozajonas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 31 May 2018 21:01:39 +1000
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.26
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Thu, 31 May 2018 08:50:31 -0000



On 05/31/2018 03:02 AM, Samuel Mendoza-Jonas wrote:
> ncsi_rsp_handler_gc() allocates the filter arrays using GFP_KERNEL in
> softirq context, causing the below backtrace. This allocation is only a
> few dozen bytes during probing so allocate with GFP_ATOMIC instead.
> 

Hi Samuel

You forgot to add

Fixes: 062b3e1b6d4f ("net/ncsi: Refactor MAC, VLAN filters")

size = (rsp->uc_cnt + rsp->mc_cnt + rsp->mixed_cnt) * ETH_ALEN;

-> seems to be able to reach more than few dozen bytes...

Also, what prevents ncsi_rsp_handler_gc() to be called multiples times ?

nc->mac_filter.addrs & nc->vlan_filter.vids would be re-allocated and memory would leak.
