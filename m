Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="gWHnDftV"; 
 dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4228Qp3PzlzF39k
 for <openbmc@lists.ozlabs.org>; Sat,  1 Sep 2018 05:23:13 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id h79-v6so5942441pfk.8
 for <openbmc@lists.ozlabs.org>; Fri, 31 Aug 2018 12:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=EMwZPO6OAFO1He04JQD5YFM3iR1ce5AVlVjlKynEuMw=;
 b=gWHnDftVeLTiO4UmgEMzBVeF1v65rRa5MsMFPickdn7F4xhENdRhjNlWROFkKcr00N
 0Gwfsf+6CvAK6sJcJVuEmPbM3vgUlnie6fVIn66nAmcXDgdFzTb5mWQFfQUtTUUfY0/X
 +1Mncxx2fj8lDHhapcyGpSMRJWpLMX9bVVEjoQiTUEdBHfWu/IZ1yevwSbcRPU2yqZNN
 DVrhXFPcGF1+UaM60QuPMInYbopvNqvDma+6wl+WKG6vHRoZ3+3FukER7KexeMfay+/m
 dVuqMh1rl//+9jzHeregKZWM526Y5x8I73a9nw7NuQowXufMGm/21lu5E07AR5E0+tVV
 2eOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=EMwZPO6OAFO1He04JQD5YFM3iR1ce5AVlVjlKynEuMw=;
 b=njo9zSWYioruw9sa/8DBLg4VaT8ubnJ6KvayoHYw5MxZjSF1YxA7WrPFwawML27F5g
 ejQiMs3XcuFLT0Bq7YgrF0PEV/4HgvQRv+/y9PycJLdLmjLaXUhkFL41+F1hQYYgocPe
 6/MIhbNjdJ+PPP8KNtITBjH/tgvyOFsR8QNHNaPUIiTuxB/aoe0uY3nsRjmXcfPDxsQK
 28OgzgimUxEECnN5RHg+QjXwZtVJRKxkc4yz7WDRBw7B9UY/+HkZJ8WCddNgvLK/BPzm
 jB+C8sWRF3/NRd3NZvrnEodeEwrsZaCD2RavhcYtRsmn6MLvhvyxoVlzVTVx5e4NVpGS
 R/9w==
X-Gm-Message-State: APzg51CfILLIocQJmQU8p6n2MToWNAjVRLQvo/97pDgKT7h/zdO11bg3
 epa5TQilV8ExbetiVzZxWZI3peDX9NkxzlsX8BOsvybS
X-Google-Smtp-Source: ANB0Vdb4fMTHQjKg9IwRWuFYX52owIKJrh2b69eCrSnOmEKnroxeLpiRWjEg9N8oFpZHX1tQ0mf0EJTKK7+wywzUu0o=
X-Received: by 2002:a63:1a1a:: with SMTP id
 a26-v6mr15716064pga.449.1535743390343; 
 Fri, 31 Aug 2018 12:23:10 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Fri, 31 Aug 2018 12:22:58 -0700
Message-ID: <CAO=notz036fNDt7M_4Ev9gy87RAJES1pqshZm4haUHSF2KoU8w@mail.gmail.com>
Subject: Style for PointerAlignment
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: openbmc@lists.ozlabs.org
X-Mailman-Version: 2.1.27
Precedence: list
List-Id: Development list for OpenBMC <openbmc.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/openbmc/>
List-Post: <mailto:openbmc@lists.ozlabs.org>
List-Help: <mailto:openbmc-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/openbmc>,
 <mailto:openbmc-request@lists.ozlabs.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Aug 2018 19:23:15 -0000

I noticed the example .clang-format in the docs/cpp style guide has
both values for PointerAlignment.  Which is correct?  I believe it's
Left so that it pairs with the type, per the other lines in the style
guide.

Patrick
