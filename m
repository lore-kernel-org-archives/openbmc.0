Return-Path: <susantjasinski@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=susantjasinski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qSIifPbY"; 
 dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44CsQx6hM1zDqD3
 for <openbmc@lists.ozlabs.org>; Tue,  5 Mar 2019 07:42:33 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id r124so3904157pgr.3
 for <openbmc@lists.ozlabs.org>; Mon, 04 Mar 2019 12:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=vaUVgt77vy1u4Tydj0f50XWkTDqw9B/90CrGlrRGSFo=;
 b=qSIifPbYEKKC615sbXqARu3QoExChd76YiUqOWKfbXkLG3HcqfSB4AyvRboI+hOYID
 84Y2Xt3bmWaePLlEpe0WNE5dUXj4jXSI0RFeA8or3hnCZaPpozBfSQpgILPAYZnWjZ+/
 okiIqlja9qwgwxatIbHTK9SWZt5LdCwDI/t1ppbcr0O5eXyV1FU0dwxukfFi95tsRpZn
 1BTZ2qzDYi6Qr5+wPq6Bw851IfY3uL23KIyDgk51G9fvhv7k1C5oxbIXg2y3B1B2I4vY
 UcDCwrLwmZbboWFMgcKf527XQ/sQfh6y2kmIy3BlilRaJE5pC0i92s5Za9/TviD9MCCF
 Ke+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=vaUVgt77vy1u4Tydj0f50XWkTDqw9B/90CrGlrRGSFo=;
 b=J+Z9X6FA44zWYBz9GBXwPeV8a7ki1RpPOCgYcMH9NKVLlBnjgUcCLSktTmTSYKOWzY
 slCpuJdgBRw6vmTZL0FhXO7qiOH5NujUJQgxzilseX1l/ayQdFfacHMQGFgvAsQovtRo
 eAIcs6J8TKl6mepZL7vwfg44kzgw7jvLFgx3Bu3BI76ayz2KCGsv2HFs8PPy/sXggj87
 5n0j9GKtk4pKF+ojOkcGosHrL0a+tw7y6yhEMxMXpZ7G29m2ir56rOy4x9m4YAJeH2J0
 nMSGQ3exBZLOVvLMSbBq6iYAi6M2NkwxvB1Q2i4AijI0FIYBUt/kQ81yAEdZWuIFu6Mx
 5mXA==
X-Gm-Message-State: APjAAAUnBKwbrLnZg44o8zMWYskkRXRYcBgrsd7hfSGc9Tc3BQtvcQWE
 O0Mox2PH/edP3H5222AjWAankeAvmdjdh+3rEWHd2G+R
X-Google-Smtp-Source: APXvYqzYbcLPLGAJqSPKnT6OyFafSA3dPTOo7GrpAJHiAO7YEAt7W04odI4FBNadDQBIUl665ouSwCcBPAeiP+rzUi4=
X-Received: by 2002:a63:c310:: with SMTP id c16mr19545174pgd.233.1551732150261; 
 Mon, 04 Mar 2019 12:42:30 -0800 (PST)
MIME-Version: 1.0
From: susan jasinski <susantjasinski@gmail.com>
Date: Mon, 4 Mar 2019 14:42:19 -0600
Message-ID: <CANT4NrKrG6hh9v82Lm+5SA1GopQvEB4AJvxEjBBf9_-D2Yq5ug@mail.gmail.com>
Subject: GUI Work Group meeting - Wednesday March 6 at 7:30AM CT
To: openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
X-List-Received-Date: Mon, 04 Mar 2019 20:42:34 -0000

This is a reminder of the OpenBMC GUI Work Group meeting scheduled for
this Wednesday, March 6 at 7:30 am CT.

Web conference:
https://ibm.webex.com/meet/susantj

Current topics:
- Network + IPV6 panel updates since our last meeting
- new Firmware panel layout due to user
feedback
- Local User Management panel suggestions to follow patterns already
established in LDAP panel

Access, agenda, and notes are in the wiki:
https://github.com/openbmc/openbmc/wiki/GUI-Design-work-group

If you have GUI panels that you want to show, please add them to the agenda.

-- Susan
