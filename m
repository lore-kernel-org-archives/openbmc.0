Return-Path: <venture@google.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=google.com
 (client-ip=2607:f8b0:4864:20::530; helo=mail-pg1-x530.google.com;
 envelope-from=venture@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="jVQASGdL"; 
 dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 43W48m4dlQzDqH2
 for <openbmc@lists.ozlabs.org>; Fri,  4 Jan 2019 10:37:43 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id t13so16632258pgr.11
 for <openbmc@lists.ozlabs.org>; Thu, 03 Jan 2019 15:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=CTDbxc1+/MhtJe+qZvs13RWWn+fVXqVkckzVj0tk8lE=;
 b=jVQASGdLnzWUNajNjtIBqxavzz6Tx6R5c77Soc2I5WPrOctvQabY8sYz5RpF1wmcqv
 8Swy0JjisLCNVz9N0BmJNhczsTKU7Lm61Fl9e1N2ewaJqs2pxRE0ygCjoL/IX1O+tIPG
 cNz/QTMQf3CgYphBrSsdr4ftOT1gTR8Q8aitv8xm/uFt1GFhnbr8c8t4sJwyypmp4g63
 p0Av4EgHzohK1przWJYe4XGCx41Vl/NEVosySxUC/XSFARmDPUEfgj0NSYHdgmc01kgq
 8lXtY0pkZxzWLwbMIgsne+I05Xhr1Ea0XP2f14LtLdyOUIn9rA01685CDcEIRMilG6Dh
 gwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=CTDbxc1+/MhtJe+qZvs13RWWn+fVXqVkckzVj0tk8lE=;
 b=llJryceSFvWLEJ8f9tFjmXuqo6d54HBCF5P+XxQT59VMOullM+M0juG0XsNcbyA1KC
 QqPaHBVw0rQ5mLwG/sLchmquvs+LHHFHWsAMM8+BzGM11W0tFYnjmrLHYWS63LWu3QSb
 khpgRkH6yFVUvqVmQ055CnHnkcJiQDmJZm+JshHSMEqTTl5CcNAXupm97MyHV0kpNK6Z
 OQ62RAgwHHH/kGZNmwQ08TpXo+E0nRqDYrLMYufVZNV0y1EHQIsG9dq0WL/sNLOZpW7C
 dfc9KNdEs70vLnWs2RbYzTNmDWm9xuXSt96JD2ma9NaNR5CVSl0y9rr3t9M8vp1QsoEV
 697Q==
X-Gm-Message-State: AJcUukfPpl132LGhWP2h3qtzOZ0e9gbpio/0HdX4eN2CRKpYertUzjIp
 fPvpVskUE+JwVZE68RyYqLpPn20KIzWojnctS2VLEHGq/B6IZg==
X-Google-Smtp-Source: ALg8bN5tAa64Eote1Z7YmcfaaGx5wQB85fGNYT/xzu32rXZoDZmdkSYwe2IBBRLebzAn6RM/tem0hfGHti44SJwWMdM=
X-Received: by 2002:a63:4d:: with SMTP id 74mr19092847pga.248.1546558660938;
 Thu, 03 Jan 2019 15:37:40 -0800 (PST)
MIME-Version: 1.0
From: Patrick Venture <venture@google.com>
Date: Thu, 3 Jan 2019 15:37:29 -0800
Message-ID: <CAO=notxxEPqizshSLonHwXNoonTTvxjuBVKYH0Z12cL4SOek7A@mail.gmail.com>
Subject: Build failure while moving forward
To: OpenBMC Maillist <openbmc@lists.ozlabs.org>
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
X-List-Received-Date: Thu, 03 Jan 2019 23:37:45 -0000

I'm seeing:

| In file included from generated.cpp:89:0:
| gen_serialization.hpp: In function 'void cereal::save(Archive&,
const sdbusplus::xyz::openbmc_project::User::Ldap::server::Config&,
uint32_t)':
| gen_serialization.hpp:1450:14: error: 'const class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'secureLDAP'
|      a(object.secureLDAP(), object.lDAPServerURI(),
object.lDAPBindDN(), object.lDAPBaseDN(), object.lDAPBINDDNpassword(),
object.lDAPSearchScope(), object.lDAPType());
|               ^~~~~~~~~~
| gen_serialization.hpp:1450:101: error: 'const class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'lDAPBINDDNpassword'
|      a(object.secureLDAP(), object.lDAPServerURI(),
object.lDAPBindDN(), object.lDAPBaseDN(), object.lDAPBINDDNpassword(),
object.lDAPSearchScope(), object.lDAPType());
|
                                ^~~~~~~~~~~~~~~~~~
| gen_serialization.hpp: In function 'void cereal::load(Archive&,
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config&,
uint32_t)':
| gen_serialization.hpp:1459:21: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'secureLDAP'
|      decltype(object.secureLDAP()) SecureLDAP{};
|                      ^~~~~~~~~~
| gen_serialization.hpp:1459:21: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'secureLDAP'
| gen_serialization.hpp:1463:21: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'lDAPBINDDNpassword'
|      decltype(object.lDAPBINDDNpassword()) LDAPBINDDNpassword{};
|                      ^~~~~~~~~~~~~~~~~~
| gen_serialization.hpp:1463:21: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'lDAPBINDDNpassword'
| gen_serialization.hpp:1467:12: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'secureLDAP'
|      object.secureLDAP(SecureLDAP);
|             ^~~~~~~~~~
| gen_serialization.hpp:1471:12: error: 'class
sdbusplus::xyz::openbmc_project::User::Ldap::server::Config' has no
member named 'lDAPBINDDNpassword'
|      object.lDAPBINDDNpassword(LDAPBINDDNpassword);
|             ^~~~~~~~~~~~~~~~~~

When I pull in 239eb56a464a2953cee573307745aa30092ae53a from
openbmc/openbmc.   It looks like that patchset with user-manager and
dbus-interfaces is also associated with my inventory-manager failure.

I don't see another inventory-manager recipe patchset to pull in, so
I'm curious what I'm missing.

Patrick
