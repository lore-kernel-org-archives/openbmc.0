Return-Path: <openbmc-patches@stwcx.xyz>
Received: from sender163-mail.zoho.com (sender163-mail.zoho.com
 [74.201.84.163])
 (using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 64E641A030F
 for <openbmc@lists.ozlabs.org>; Thu, 28 Jan 2016 19:00:40 +1100 (AEDT)
Received: from localhost (172.110.7.206 [172.110.7.206]) by mx.zohomail.com
 with SMTPS id 1453968037987132.80482613600975;
 Thu, 28 Jan 2016 00:00:37 -0800 (PST)
From: OpenBMC Patches <openbmc-patches@stwcx.xyz>
To: openbmc@lists.ozlabs.org
Subject: [PATCH phosphor-rest-server] The streaming support for obmc-rest.
Date: Thu, 28 Jan 2016 02:00:36 -0600
Message-Id: <1453968037-28661-1-git-send-email-openbmc-patches@stwcx.xyz>
X-Mailer: git-send-email 2.6.4
X-Zoho-Virus-Status: 1
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
X-List-Received-Date: Thu, 28 Jan 2016 08:00:42 -0000

Changes:
1) The main idea of this change is to have a streaming path as below:
    dbus signal -> obmc-rest capture the dbus signal -> obmc-rest notify the client of the signal receiving.
2) Replace rocket with gevent WSGI server to support multiple async accesses.
3) Use gevent queue to notify the dbus signal receiving.
4) The uri to the streaming should be in the form as below:
    https://<ip>/<path>/stream/<signal_name>

https://github.com/openbmc/phosphor-rest-server/pull/15

shgoupf (1):
  The streaming support for obmc-rest.

 obmc-rest | 115 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 104 insertions(+), 11 deletions(-)
 mode change 100644 => 100755 obmc-rest

-- 
2.6.4
