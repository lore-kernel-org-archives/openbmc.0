Return-Path: <kurt.r.taylor@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=kurt.r.taylor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VqrxiotD"; 
 dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44PcKG57TBzDqRN
 for <openbmc@lists.ozlabs.org>; Thu, 21 Mar 2019 04:26:26 +1100 (AEDT)
Received: by mail-oi1-x233.google.com with SMTP id 67so2431805oif.10
 for <openbmc@lists.ozlabs.org>; Wed, 20 Mar 2019 10:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=pA3p/S7TLoZwWhknM76uDQz6BoPtgh2wwsjavckq3a4=;
 b=VqrxiotDdX8bAcbVtA+ZZhIOXDDXTKMCc9g6pqNAmnWfcO+VQpp9QZNau5H6vXHg99
 irV86xfcSRNNeNSh6KirhhK8BzVEqGcqYRbC+PPuir2GCH8AvNgGhiFo8bgMDWtdt9vY
 arkavBZPQmLDqw3u7ckAvLrpbzbwlG06wE5hNJNXzdv9WR3UFzF5v5k5ceQgfxggxAEj
 wIXi0vBMsA3yADaPtd8mArvYBF9gpvZXQOl627ZwhWu2Z8Im5b0VB8QRyMogoGOeAt/o
 KGF//WMOgHp+jLvgbYcGtSQYi7CkPqjXLewpz1suzBliuNfKr/lYQiFwhR9yKUaoON8R
 beTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pA3p/S7TLoZwWhknM76uDQz6BoPtgh2wwsjavckq3a4=;
 b=QwRRKgdZ11FnP0MQK6HhcX3igmZBOVXj59Q7j6TaQnL1wjHJ+2cor8OMKq37Kv4cqO
 9hoXtm3blJAKNvdrSidHak6LV4h1SERbNChn1Mhs7qvlERPjYCrtzSp2IqlcMWl9CySF
 h3X2ZFWRl5iIIrnXz9E/L12t3nRrc5OO429b27lK6dHuHsecJuWD37MQh+UAayNnG4Qx
 ubxZN3cVs8EYuOH+Y4cl0Re47aL2N6JHnkHtdv6482h6bdv0bm3iexOJ/zGf+zsOY5oZ
 BnFDDKkKAjrHbqlnSrvQs6g/dH+niZnpzGi7Q3kPYOpRIyr2iM+mpSkNdptNkUWQnVN6
 yRwg==
X-Gm-Message-State: APjAAAX2XNEjRtpblUytuS9M+pwFH0/pRiXVNQUCzM+lzLS7wSkLcCAK
 jOS6vs1x1m4Q9zMGOInYH7lhVg18
X-Google-Smtp-Source: APXvYqwLfSm3EwN+p3PMgV7pxn9oKhTkqGCWvJ88U2+ZfUBxoqCvqhNH9iFs9GEaWsmjZIhZrT7yog==
X-Received: by 2002:aca:db0b:: with SMTP id s11mr5638048oig.37.1553102781652; 
 Wed, 20 Mar 2019 10:26:21 -0700 (PDT)
Received: from krtaylors-MacBook-Pro.local (072-182-100-019.res.spectrum.com.
 [72.182.100.19])
 by smtp.gmail.com with ESMTPSA id e138sm1059056oih.27.2019.03.20.10.26.20
 for <openbmc@lists.ozlabs.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 20 Mar 2019 10:26:20 -0700 (PDT)
Subject: Re: Intel-BMC on github
To: openbmc@lists.ozlabs.org
References: <C599FC839619124CAC44E062ABB7DFE2D7A61D0F@ORSMSX115.amr.corp.intel.com>
From: krtaylor <kurt.r.taylor@gmail.com>
Message-ID: <e1aab121-8ef8-8548-4b0e-f45e5ce30a28@gmail.com>
Date: Wed, 20 Mar 2019 12:26:20 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <C599FC839619124CAC44E062ABB7DFE2D7A61D0F@ORSMSX115.amr.corp.intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2019 17:26:27 -0000

On 3/19/19 2:34 PM, Mihm, James wrote:
> Intel announces that its internal repository based on the OpenBMC 
> project is being made public on github under the organization name of 
> Intel-BMC.
> 
> Intel is sharing the latest internal repositories in response to 
> requests from partners and customers to be able to build an OpenBMC 
> firmware image that will run on an existing Intel server platform. The 
> repositories include content that has not yet been upstreamed to the LF 
> OpenBMC project.

Thanks for announcing this, and the intention to continue to contribute 
and support the OpenBMC project. We eagerly anticipate Intel sharing 
their development plans and proposals for contribution with the 
community. If there is anything I can do to expedite this, please don't 
hesitate to let me know.

Kurt Taylor (krtaylor)
