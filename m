Return-Path: <peterh@google.com>
Received: from mail-it0-x22e.google.com (mail-it0-x22e.google.com
 [IPv6:2607:f8b0:4001:c0b::22e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3vpQPm0QD0zDq7N
 for <openbmc@lists.ozlabs.org>; Thu, 23 Mar 2017 10:10:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dNsZ1iw/"; 
 dkim-atps=neutral
Received: by mail-it0-x22e.google.com with SMTP id w124so31244806itb.1
 for <openbmc@lists.ozlabs.org>; Wed, 22 Mar 2017 16:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=khonhBGu/ZxLBTUZ3p4VpudNxKfhAO9ARI5kfAXTmFM=;
 b=dNsZ1iw/KNiUMxckmePW4vm5zeNX+Sk9RqesB3HAtUV5cpETNxAWmBklU0WwOaKhSc
 7HWfkOvIJxzpmeF64QEFCQ7XYEzmLhVOBDzySHanvH0JXaT5uEh4enUasIRz6tfm6Lci
 9GjepE52lnjGaCHw3BFogyBaTiqYUZJo2Ds8umxzXdGL8BFfhvE86BEA4sTA7/rvg7lT
 jYDd5VhlBVZFJffsAvoUcsjtZb/AdZsDdd8jNZJ3u7enJGrCzOia8IsGstvYXZ+xXaUe
 jcsxWcrK478PcsEPoTdS284D1VpdwI/EA811MnCD5ELgzwsZdjXE8xJ6T36xOJYNcqdP
 snng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=khonhBGu/ZxLBTUZ3p4VpudNxKfhAO9ARI5kfAXTmFM=;
 b=o5ifO2oCWFF3Rzc1S49kUriMAT7cCSZOoZ4F7Lpe80YdFTWDHuPQ6nQKN23YiV+iLP
 NGuJvToXP9iNgRcr8i5dL4G6sVkJ3oPRsJe+9vBQz29Jm7bqRnQ01KUq0W3C+BENzlHT
 ntx6sjNMnGf2Nz4UdDDjEoNunpMIFt6GXOcEWQJTGTdDqpPCFqWDOmV5JLo7rkoh2mCj
 oivLZaaqD2tKUxGdGEDpVhGzThA0cEU0yw0fNPFw/xWB1IzVOibWcDFBlfTQ+IxlmT/M
 M/VUw2vAC3fsLKWxRq1hoWs1Xw2s3qqsI5KgO5DaWV9uzv9Vwtk2ijShq5UF5suAWMKL
 pV9g==
X-Gm-Message-State: AFeK/H1fYCSQTcionOn3Cvl+3MGrc3D3hGIWT4M0ZNaYVdRsmNR6HlYbxXrR6iEMlxCVjy/s9XFr7Ei7LWTObRzU
X-Received: by 10.36.138.129 with SMTP id v123mr10501858itd.108.1490224201712; 
 Wed, 22 Mar 2017 16:10:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.36.84.202 with HTTP; Wed, 22 Mar 2017 16:10:01 -0700 (PDT)
In-Reply-To: <CAPozSNqWfu9_+uY7Hs4ALQknS2GPnPpp8xe7eD1ShmuNjEEzoQ@mail.gmail.com>
References: <CAPozSNqWfu9_+uY7Hs4ALQknS2GPnPpp8xe7eD1ShmuNjEEzoQ@mail.gmail.com>
From: Peter Hanson <peterh@google.com>
Date: Wed, 22 Mar 2017 16:10:01 -0700
Message-ID: <CAPozSNrxpwad0cFsamtkbnNtzdwBy+KRwbxviU3u_XEXsOV3=Q@mail.gmail.com>
Subject: Re: [PATCH] Add Zaius device tree entry for 12V Delta Power Brick.
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC <openbmc@lists.ozlabs.org>, Xo Wang <xow@google.com>
Content-Type: text/plain; charset=UTF-8
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
X-List-Received-Date: Wed, 22 Mar 2017 23:10:04 -0000

Oops that ate my tabs, sorry. Will repost after I defeat my email client.
