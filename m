Return-Path: <mine260309@gmail.com>
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:400e:c00::242; helo=mail-pf0-x242.google.com;
 envelope-from=mine260309@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dMtSq1Qv"; 
 dkim-atps=neutral
Received: from mail-pf0-x242.google.com (mail-pf0-x242.google.com
 [IPv6:2607:f8b0:400e:c00::242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 409tdW0y2VzF2J8
 for <openbmc@lists.ozlabs.org>; Wed, 28 Mar 2018 14:28:46 +1100 (AEDT)
Received: by mail-pf0-x242.google.com with SMTP id f15so478149pfn.0
 for <openbmc@lists.ozlabs.org>; Tue, 27 Mar 2018 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=9P/DiIt4X5SSyDzr4Zpuo4zeaV+YQsFBrgu2AjhLcQM=;
 b=dMtSq1Qvdg/D3/ShFk/1U71YvEt1D2XDiZZXH+WeXKWCuNA3RXOEqa8wxlbRsFYpSq
 1qtBffXHoNMjKn9lswJ/enYFX1mZLhFCd8wB9WV5ECvp4Vj7hd4bEQD9xbSQ0zEaVT3B
 2PcWJOeqh3DQTjskmDIArktf/fP4/GUyTKRZCsSTWRoeLZP83Gqc7BcC9tzhFRPiahmX
 N7hanGWHwloPWmamhuf7XULrFc0izrbsIbiwbnPIYGbLeE7NnhfGIy3HHj9+fhFXY+Li
 +GLBJougFyqiFj1/M2OnBQeuvIbmK6b4F09p0N9rVi15Y1fSCXWZ0+zrjyJfqhXqfS/W
 eFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=9P/DiIt4X5SSyDzr4Zpuo4zeaV+YQsFBrgu2AjhLcQM=;
 b=lnpSKKxsTWN4ebYdiQkurqsKfgDJxrPrJziLPDLN0kSSUW0du+a6lZQ2CMqtZ/20/K
 SVN7UazXyqFYY2GaPlDytF6VXDM/cE1kCT57MkP0AZMyVjB0UJGm+w8C3na/HdgYK+vU
 n/YjFU2h+AJTENOuTzk7Mb52CH7CZgAqUORLTig4efdnfA4mPhdq7lxqhF59WlPDcenz
 b/A0favQumDWEk16mhrPsvd3IeqraAQwfIyUYXZRdbLnHhnKmL5dhRsEJQHcTvzJqwxH
 qo9eaEGaCk1/No+O6VsRRWoG8PTVzQUBfvKyF7mlJyX/jhpQY/aMmF4v7DuPo/QjdRCv
 wO0A==
X-Gm-Message-State: AElRT7F+MK89NzU/qykNLkTEA/5SMYnXBp/03sDxhVVx8PfbjFIhTNsC
 OIcn4ay7XaNkHiqGQmpFySeLRv6j
X-Google-Smtp-Source: AIpwx4/GamPDRyMFszLXDqaor21oLNmox1A5jjmvmch2rKydn1xc0Mioc3lTlU3XtBAJ9VATAY3/tw==
X-Received: by 10.98.201.194 with SMTP id l63mr1558971pfk.126.1522207724722;
 Tue, 27 Mar 2018 20:28:44 -0700 (PDT)
Received: from localhost (45.62.100.246.16clouds.com. [45.62.100.246])
 by smtp.gmail.com with ESMTPSA id r14sm5365806pfa.163.2018.03.27.20.28.43
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Tue, 27 Mar 2018 20:28:43 -0700 (PDT)
From: Lei YU <mine260309@gmail.com>
To: openbmc@lists.ozlabs.org
Subject: [PATCH linux dev-4.13 v2] clk: aspeed: Mark bclk (PCIe) and dclk
 (VGA) as critical
Date: Wed, 28 Mar 2018 11:27:22 +0800
Message-Id: <1522207642-27653-1-git-send-email-mine260309@gmail.com>
X-Mailer: git-send-email 1.9.1
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
X-List-Received-Date: Wed, 28 Mar 2018 03:28:47 -0000

From: Joel Stanley <joel@jms.id.au>

This is used by the host to talk to the BMC's PCIe slave device. The BMC
is not involved, but the clock needs to be enabled so the host can use
the device.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Lei YU <mine260309@gmail.com>
Acked-by: Andrew Jeffery <andrew@aj.id.au>
Tested-by: Lei YU <mine260309@gmail.com>
---
 drivers/clk/clk-aspeed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
index 5af80b4..4d25a4c 100644
--- a/drivers/clk/clk-aspeed.c
+++ b/drivers/clk/clk-aspeed.c
@@ -97,8 +97,8 @@ static const struct aspeed_gate_data aspeed_gates[] = {
 	[ASPEED_CLK_GATE_GCLK] =	{  1,  7, "gclk-gate",		NULL,	0 }, /* 2D engine */
 	[ASPEED_CLK_GATE_MCLK] =	{  2, -1, "mclk-gate",		"mpll",	CLK_IS_CRITICAL }, /* SDRAM */
 	[ASPEED_CLK_GATE_VCLK] =	{  3,  6, "vclk-gate",		NULL,	0 }, /* Video Capture */
-	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	0 }, /* PCIe/PCI */
-	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	0 }, /* DAC */
+	[ASPEED_CLK_GATE_BCLK] =	{  4, 10, "bclk-gate",		"bclk",	CLK_IS_CRITICAL }, /* PCIe/PCI */
+	[ASPEED_CLK_GATE_DCLK] =	{  5, -1, "dclk-gate",		NULL,	CLK_IS_CRITICAL }, /* DAC */
 	[ASPEED_CLK_GATE_REFCLK] =	{  6, -1, "refclk-gate",	"clkin", CLK_IS_CRITICAL },
 	[ASPEED_CLK_GATE_USBPORT2CLK] =	{  7,  3, "usb-port2-gate",	NULL,	0 }, /* USB2.0 Host port 2 */
 	[ASPEED_CLK_GATE_LCLK] =	{  8,  5, "lclk-gate",		NULL,	0 }, /* LPC */
-- 
2.7.4
