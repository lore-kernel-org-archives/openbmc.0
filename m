Return-Path: <jaghu@google.com>
Received: from mail-wm0-x230.google.com (mail-wm0-x230.google.com
 [IPv6:2a00:1450:400c:c09::230])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 3tVDqL22F3zDvtw
 for <openbmc@lists.ozlabs.org>; Fri,  2 Dec 2016 11:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.b="dVF0Zg4m"; 
 dkim-atps=neutral
Received: by mail-wm0-x230.google.com with SMTP id g23so1910504wme.1
 for <openbmc@lists.ozlabs.org>; Thu, 01 Dec 2016 16:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=Nm8UkfoeydcIA81XuaamxCo5iVuL0/v2kgKuw8VPsUA=;
 b=dVF0Zg4mhjz33cqM4eeh7l8UMaRpDgvag4qYadI58Ra9uYjg1fWG71G6Yv18o4F22E
 JGg4gxJqtNQTVi7I0uuwsIQuFgDoT/5aQDwEN5zK9ov2QkvEbkXDxXyU5zM2YB6oeUaN
 Lubj0kQtkXr8+i4xu9XbYrqgT4BtlzCZt+KW2SEQfDYhMHEXJvFfQBKRaUqa7hflmEUF
 TH7lmdIWrnKnFdG1hxVBGeX6AqZ6agUqM8Ifw/SECqX5HWChRZWB8oaZ1kNOOtwWtoYT
 DTWbQA7Iqwl9+fNnOD1FzbcYoywKpVkvSlDESlOUPJF7Q2QyuVCeO1HHuLG2q3MSwv5F
 Sc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20130820;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=Nm8UkfoeydcIA81XuaamxCo5iVuL0/v2kgKuw8VPsUA=;
 b=hFZf5AXgFRTW6RbpdaWyWgfm3jSycoJRtAueaBJ0EzB2WKnYoANwtgyM2yzD8CeMCu
 L2BzOAjRdJOuKkYLMvEPEAPZZwt2IwgPOlPA3KBBJ57ct92+5hhHxZrPfCwWwG9BnhfH
 sAfesfO9sj0B7l2SmhpPfS0DYmprwRC3DZ7ikoeT8D806YqtcnMCOEJq1AuiaqtLbTpZ
 WZo7+/jAdlJ1YDOnrtzLDrC6SL2wovQ6dJi4y/HxtQs1VNRwt8kDiJplhUobiyaOHV+e
 8X+CG2o/iHOzZ7zVG063jsTSsFR8RYlek8amsCN+Aw+kMV5K5Fcxmw2K39ogW3W2IGCg
 /zZA==
X-Gm-Message-State: AKaTC00qubKhiB9YmGUZf3AhF56UeUI6/FjkhYJyGYMHF9+wni2knIugWmQR/bqnx65BlSwXHdZXh17q7dHAAbYN
X-Received: by 10.28.214.84 with SMTP id n81mr299865wmg.120.1480636937212;
 Thu, 01 Dec 2016 16:02:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.146.147 with HTTP; Thu, 1 Dec 2016 16:01:56 -0800 (PST)
In-Reply-To: <CACPK8XceGn6MRdR6ntMte1MA3HZA5C0Y_vDZYCUP=9bMwOeHWw@mail.gmail.com>
References: <1479979610-2958-1-git-send-email-jaghu@google.com>
 <1479979610-2958-3-git-send-email-jaghu@google.com>
 <CACPK8XceGn6MRdR6ntMte1MA3HZA5C0Y_vDZYCUP=9bMwOeHWw@mail.gmail.com>
From: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Date: Thu, 1 Dec 2016 16:01:56 -0800
Message-ID: <CANsWYUUytvJ+yyX+Po2qgcA+hYfDr6pGVPT6QaSk1C=O9qT_ig@mail.gmail.com>
Subject: Re: [PATCH linux v3 2/3] drivers: hwmon: Hwmon driver for ASPEED
 AST2400/2500 PWM support
To: Joel Stanley <joel@jms.id.au>
Cc: OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary=001a1147286caf6b4d0542a1a6c7
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
X-List-Received-Date: Fri, 02 Dec 2016 00:02:25 -0000

--001a1147286caf6b4d0542a1a6c7
Content-Type: text/plain; charset=UTF-8

On Sun, Nov 27, 2016 at 10:13 PM, Joel Stanley <joel@jms.id.au> wrote:

> Hello Jaghu,
>
> This is looking better. I have some more comments below.
>
> On Thu, Nov 24, 2016 at 7:56 PM, Jaghathiswari Rankappagounder
> Natarajan <jaghu@google.com> wrote:
>
> > +The ASPEED AST2400/2500 PWM controller supports 8 PWM output ports.
> > +PWM clock types M, N and 0 are three types just to have three
> independent PWM
> > +sources. Each port can be assigned a different PWM clock type.
>
> I suggest you describe the types.
>
> And add some newlines between your paragraphs to make it easier to read.
>
> > +The device driver matches on the device tree node. The configuration
> values
> > +are read from the device tree and written to the respective registers.
> > +The driver provides a sysfs entry "pwm1" through which the user can
> > +configure the duty-cycle value (ranging from 0 to 255; 255 is 100
> percent).
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index d4de8d5..7f75b01 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -341,6 +341,19 @@ config SENSORS_ASB100
> >           This driver can also be built as a module.  If so, the module
> >           will be called asb100.
> >
> > +config SENSORS_ASPEED_PWM
> > +       tristate "ASPEED AST2400/AST2500 PWM driver"
> > +       help
> > +         This driver provides support for ASPEED AST2400/AST2500 PWM
> > +         controller and output ports. The ASPEED PWM controller can
> support 8
> > +         PWM outputs. PWM clock types M, N and 0 are three types just
> to have three
> > +         independent PWM sources. Each could be assigned to the 8 PWM
> port
> > +         with its own settings. The user can configure duty cycle
> through
> > +         the exposed hwmon sysfs entry "pwm".
> > +
> > +         This driver can also be built as a module.  If so, the module
> > +         will be called aspeed-pwm.
>
> Make sure you test the code both as a module and built in to the kernel.
>
> > +
> > +struct aspeed_pwm_port_data {
> > +       u8 pwm_port;
> > +       u8 pwm_enable;
> > +       u8 pwm_type;
> > +       u8 pwm_fan_ctrl;
> > +       void __iomem *base;
> > +};
> > +
> > +enum pwm_clock_type { TYPEM, TYPEN, TYPEO };
> > +
> > +struct pwm_clock_type_params {
> > +       u32 l_value;
> > +       u32 l_mask;
> > +       u32 h_value;
> > +       u32 h_mask;
> > +       u32 unit_value;
> > +       u32 unit_mask;
> > +       u32 ctrl_reg_offset;
>
> ctrl_reg or even just ctrl will do.
>
> > +};
> > +
>
> I think this is an improvement on the duplicated swtich statements we
> had before. Do you agree?
>
> I'm wondering if there are still ways to clean up. The mask and the
> value both tell us where in the register each value needs to go;
> perhaps we can only include one of them in the pwm_clock_type_params?
>
> > +static const struct pwm_clock_type_params pwm_clock_type_params[] = {
> > +       [TYPEM] = {
> > +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEM_L,
> > +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_L_MASK,
> > +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEM_H,
> > +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_H_MASK,
> > +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT,
> > +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEM_UNIT_MASK,
> > +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
> > +       },
> > +       [TYPEN] = {
> > +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEN_L,
> > +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_L_MASK,
> > +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEN_H,
> > +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_H_MASK,
> > +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT,
> > +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEN_UNIT_MASK,
> > +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL,
> > +       },
> > +       [TYPEO] = {
> > +               .l_value = ASPEED_PTCR_CLK_CTRL_TYPEO_L,
> > +               .l_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_L_MASK,
> > +               .h_value = ASPEED_PTCR_CLK_CTRL_TYPEO_H,
> > +               .h_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_H_MASK,
> > +               .unit_value = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT,
> > +               .unit_mask = ASPEED_PTCR_CLK_CTRL_TYPEO_UNIT_MASK,
> > +               .ctrl_reg_offset = ASPEED_PTCR_CLK_CTRL_EXT,
> > +       }
> > +};
> > +
> > +enum pwm_port { PWMA, PWMB, PWMC, PWMD, PWME, PWMF, PWMG, PWMH };
> > +
> > +struct pwm_port_params {
> > +       u32 pwm_en;
> > +       u32 ctrl_reg_offset;
> > +       u32 pwm_type_part1;
> > +       u32 pwm_type_part2;
> > +       u32 pwm_type_mask;
> > +       u32 duty_ctrl_rise_point;
> > +       u32 duty_ctrl_fall_point;
> > +       u32 duty_ctrl_reg_offset;
> > +       u8 duty_ctrl_calc_type;
> > +};
> > +
> > +static const struct pwm_port_params pwm_port_params[] = {
> > +       [PWMA] = {
> > +               .pwm_en = ASPEED_PTCR_CTRL_PWMA_EN,
> > +               .ctrl_reg_offset = ASPEED_PTCR_CTRL,
> > +               .pwm_type_part1 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART1,
> > +               .pwm_type_part2 = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_PART2,
> > +               .pwm_type_mask = ASPEED_PTCR_CTRL_SET_PWMA_TYPE_MASK,
> > +               .duty_ctrl_rise_point = DUTY_CTRL_PWM1_RISE_POINT,
> > +               .duty_ctrl_fall_point = DUTY_CTRL_PWM1_FALL_POINT,
> > +               .duty_ctrl_reg_offset = ASPEED_PTCR_DUTY0_CTRL,
> > +               .duty_ctrl_calc_type = 0,
> > +       },
> > +
> > +static inline void
> > +aspeed_pwm_write(void __iomem *base, u32 val, u32 reg)
> > +{
> > +       writel(val, base + reg);
>
> Is there a reason you're using writel and not iowrite32?
>
> > +}
> > +
> > +static inline u32
> > +aspeed_pwm_read(void __iomem *base, u32 reg)
> > +{
> > +       u32 val = readl(base + reg);
> > +       return val;
>
> You could just do return readl(base + reg).
>
> That said, do you think the helpers for _read and _write are worth it?
>
> > +}
> > +
> > +static void
> > +aspeed_set_pwm_clock_enable(void __iomem *base, bool val)
>
> Most kernel code puts the type and storage class specifiers on the
> same line as the function:
>
> static void aspeed_set_pwm_clock_enable(void __iomem *base, bool val)
>
> > +{
> > +       u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
> > +
> > +       if (val)
> > +               reg_value |= ASPEED_PTCR_CTRL_CLK_EN;
> > +       else
> > +               reg_value &= ~ASPEED_PTCR_CTRL_CLK_EN;
> > +
> > +       aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
> > +}
> > +
> > +static void
> > +aspeed_set_pwm_clock_source(void __iomem *base, bool val)
>
> When I call this function I'm going to write something like this:
>
> aspeed_set_pwm_clock_source(foo, true);
>
> It doesn't make sense to be setting a clock source to "true". I think
> you could call it aspeed_pwm_use_pclk() or similar, so the boolean
> makes sense.
>
> > +{
> > +       u32 reg_value = aspeed_pwm_read(base, ASPEED_PTCR_CTRL);
> > +
> > +       if (val)
> > +               reg_value |= ASPEED_PTCR_CTRL_CLK_SRC;
> > +       else
> > +               reg_value &= ~ASPEED_PTCR_CTRL_CLK_SRC;
> > +
> > +       aspeed_pwm_write(base, reg_value, ASPEED_PTCR_CTRL);
> > +}
> > +
> > +static void
> > +aspeed_set_pwm_clock_division_h(void __iomem *base, u8 pwm_clock_type,
> > +               u8 div_high)
> > +{
> > +       u32 reg_offset = pwm_clock_type_params[pwm_
> clock_type].ctrl_reg_offset;
> > +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> > +
> > +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].h_mask;
> > +       reg_value |= div_high << pwm_clock_type_params[pwm_
> clock_type].h_value;
> > +
> > +       aspeed_pwm_write(base, reg_value, reg_offset);
> > +}
> > +
> > +static void
> > +aspeed_set_pwm_clock_division_l(void __iomem *base, u8 pwm_clock_type,
> > +               u8 div_low)
> > +{
>
> You could pass around a pointer to the clock type, instead of the index.
>
> Even better would be some kind of struct that includes both base and
> the clock type.
>
> > +       u32 reg_offset = pwm_clock_type_params[pwm_
> clock_type].ctrl_reg_offset;
> > +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> > +
> > +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].l_mask;
> > +       reg_value |= div_low << pwm_clock_type_params[pwm_
> clock_type].l_value;
> > +
> > +       aspeed_pwm_write(base, reg_value, reg_offset);
> > +}
>
> Is there ever a case where you will set the high but not the low bit?
> If not you could do this:
>
> aspeed_set_pwm_clock_division(void __iomem *base, u8 pwm_clock_type,
> u8 div_low, u8 div_high)
> {
>        struct pwm_clock_type *pwm = &pwm_clock_type_params[pwm_
> clock_type];
>        u32 reg = aspeed_pwm_read(base, pwm->ctrl_reg_offset);
>
>        reg &= ~(pwm->l_mask | pwm->h_mask);
>        reg |= (div_low << pwm->l_value) | (div_high << pwm->h_value);
>
>        aspeed_pwm_write(base, reg, pwm->ctrl_reg_offset);
> }
>
> I suggest attempting cleanups like this to other parts of your code.
>
> > +
> > +static void
> > +aspeed_set_pwm_clock_unit(void __iomem *base, u8 pwm_clock_type,
> > +               u8 unit)
> > +{
> > +       u32 reg_offset = pwm_clock_type_params[pwm_
> clock_type].ctrl_reg_offset;
> > +       u32 reg_value = aspeed_pwm_read(base, reg_offset);
> > +
> > +       reg_value &= ~pwm_clock_type_params[pwm_clock_type].unit_mask;
> > +       reg_value |= unit << pwm_clock_type_params[pwm_
> clock_type].unit_value;
> > +
> > +       aspeed_pwm_write(base, reg_value, reg_offset);
> > +}
> > +
>
> > +static void
> > +aspeed_set_pwm_fan_ctrl(struct aspeed_pwm_port_data *priv, u8 fan_ctrl)
> > +{
> > +       u16 period;
> > +       u16 dc_time_on;
> > +
> > +       period = aspeed_get_pwm_clock_unit(priv, priv->pwm_type);
> > +       period += 1;
> > +       dc_time_on = (fan_ctrl * period) / PWM_MAX;
> > +
> > +       if (dc_time_on == 0) {
> > +               aspeed_set_pwm_enable(priv, 0);
>
> Doesn't aspeed_set_pwm_enable take a boolean as the second parameter?
>
> > +       } else {
> > +               if (dc_time_on == period)
> > +                       dc_time_on = 0;
> > +
> > +               aspeed_set_pwm_duty_rising(priv, 0);
> > +               aspeed_set_pwm_duty_falling(priv, dc_time_on);
> > +               aspeed_set_pwm_enable(priv, 1);
> > +       }
> > +}
> > +
> > +static ssize_t
> > +set_pwm(struct device *dev, struct device_attribute *attr, const char
> *buf,
> > +               size_t count)
> > +{
> > +       struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
> > +       u8 fan_ctrl;
> > +       int ret;
> > +
> > +       ret = kstrtou8(buf, 10, &fan_ctrl);
>
> If you specify 0 as the format, then users can pass their clock rate
> in as hexadecimal (not that it would make much sense...) or decimal
> and the sysfs file will do the correct thing.

The user is passing the duty cycle value here (and not the clock rate).

> > +       if (ret)
> > +               return -EINVAL;
> > +
> > +       if (fan_ctrl < 0 || fan_ctrl > PWM_MAX)
> > +               return -EINVAL;
> > +
> > +       if (priv->pwm_fan_ctrl == fan_ctrl)
> > +               return count;
> > +
> > +       priv->pwm_fan_ctrl = fan_ctrl;
> > +       aspeed_set_pwm_fan_ctrl(priv, fan_ctrl);
> > +
> > +       return count;
> > +}
> > +
> > +static ssize_t
> > +show_pwm(struct device *dev, struct device_attribute *attr, char *buf)
> > +{
> > +       struct aspeed_pwm_port_data *priv = dev_get_drvdata(dev);
> > +
> > +       return sprintf(buf, "%u\n", priv->pwm_fan_ctrl);
> > +}
> > +
> > +static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm,
> 0);
> > +
> > +static struct attribute *pwm_dev_attrs[] = {
> > +       &sensor_dev_attr_pwm1.dev_attr.attr,
> > +       NULL,
> > +};
> > +
> > +ATTRIBUTE_GROUPS(pwm_dev);
> > +
> > +static int
> > +aspeed_create_pwm_port(struct device *dev, struct device_node *child,
> > +               void __iomem *base)
> > +{
> > +       struct device *hwmon;
> > +       u8 val;
> > +       struct aspeed_pwm_port_data *priv;
> > +
> > +       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +       if (!priv)
> > +               return -ENOMEM;
> > +
> > +       hwmon = devm_hwmon_device_register_with_groups(dev,
> "aspeed_pwm",
> > +                                                     priv,
> pwm_dev_groups);
> > +       if (IS_ERR(hwmon)) {
> > +               dev_err(dev, "Failed to register hwmon device\n");
> > +               return PTR_ERR(hwmon);
> > +       }
> > +       priv->base = base;
> > +
> > +       of_property_read_u8(child, "pwm_port", &val);
> > +       priv->pwm_port = val;
> > +
> > +       of_property_read_u8(child, "pwm_enable", &val);
> > +       priv->pwm_enable = val;
> > +       aspeed_set_pwm_enable(priv, val);
> > +
> > +       of_property_read_u8(child, "pwm_type", &val);
> > +       priv->pwm_type = val;
> > +       aspeed_set_pwm_type(priv, val);
> > +
> > +       of_property_read_u8(child, "pwm_fan_ctrl", &val);
> > +       priv->pwm_fan_ctrl = val;
> > +       aspeed_set_pwm_fan_ctrl(priv, val);
> > +
> > +       return 0;
> > +}
> > +
> > +/*
> > + * If the clock type is type M then :
> > + * The PWM frequency = 24MHz / (type M clock division L bit *
> > + * type M clock division H bit * (type M PWM period bit + 1))
> > + * Calculate type M clock division L bit and H bits given the other
> values
> > + */
> > +static bool
> > +set_clock_values(u32 pwm_frequency, u32 period, u8 type, void __iomem
> *base)
> > +{
> > +       u32 src_frequency = 24000000;
>
> Where does this come from? It's the pclk I think. This means your
> binding should do something like this:
>
>   clocks = <&clk_apb>;
>
> Then in your code,
>
> pclk = devm_clk_get(&pdev->dev, NULL);
> pclk_rate = clk_get_rate(pclk);
>
> and then use clck_rate where you have 'src_frequency' to calculate the
> divisor values. A hwmon driver that does this is g762.c.

For the PWM and Fan Tach controller, in the register PTCR00 (AST2500
datasheet page - 671) it is given as :

Clock source selection
0: from 24MHz
1: from MCLK

24MHz seems to be hardcoded. I am not sure which clock producer to use
for 24MHz and for MCLK.

CLKIN seems to have the option of being either 24MHz and 25 MHz.

I am not sure how the pclk is related here.


> > +       u32 divisor = src_frequency / pwm_frequency;
> > +       u32 clock_divisor = divisor / (period + 1);
> > +       u32 tmp_clock_divisor;
> > +       u8 low;
> > +       u8 high;
> > +       u32 calc_high;
> > +       u32 calc_low;
> > +
> > +       for (high = 0; high <= MAX_HIGH_LOW_BIT; high += 1) {
> > +               for (low = 0; low <= MAX_HIGH_LOW_BIT; low += 1) {
> > +                       calc_high = 0x1 << high;
> > +                       calc_low = (low == 0 ? 1 : (2 * low));
> > +                       tmp_clock_divisor = calc_high * calc_low;
> > +                       if (tmp_clock_divisor >= clock_divisor)
> > +                               goto set_value;
> > +               }
> > +       }
> > +
> > +       return false;
> > +
> > +set_value:
> > +       aspeed_set_pwm_clock_division_h(base, type, high);
> > +       aspeed_set_pwm_clock_division_l(base, type, low);
> > +       aspeed_set_pwm_clock_unit(base, type, period);
> > +
> > +       return true;
> > +}
> > +
> > +static int
> > +aspeed_pwm_probe(struct platform_device *pdev)
> > +{
> > +       u32 period;
> > +       struct device_node *np, *child;
> > +       struct resource *res;
> > +       void __iomem *base;
> > +       bool success;
> > +       struct clk *typem_clk, *typen_clk, *typeo_clk;
> > +       u32 pwm_typem_freq, pwm_typen_freq, pwm_typeo_freq;
> > +       int err;
> > +
> > +       np = pdev->dev.of_node;
> > +
> > +       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +       if (res == NULL)
> > +               return -ENOENT;
> > +
> > +       base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
> > +       if (!base)
> > +               return -ENOMEM;
> > +
> > +       /* Enable PWM clock */
> > +       aspeed_set_pwm_clock_enable(base, 1);
>
> You're passing a '1' to a function that expects a boolean value.
>
> > +       /* Select clock source as 24MHz */
> > +       aspeed_set_pwm_clock_source(base, 0);
>
> This would be selected by your device tree bindings. You could have it
> so if a clock node is populated, it uses that value, and if it's not
> it falls back on the 1MHz clock.
>
> > +
> > +       typem_clk = of_clk_get(np, 0);
>
> This isn't what I meant. See the comment above about referencing the
> parent clock in the bindings.
>
> > +       if (!IS_ERR(typem_clk))
> > +               pwm_typem_freq = clk_get_rate(typem_clk);
> > +       else
> > +               return -EINVAL;
> > +
> > +       typen_clk = of_clk_get(np, 1);
> > +       if (!IS_ERR(typen_clk))
> > +               pwm_typen_freq = clk_get_rate(typen_clk);
> > +
> > +       typeo_clk = of_clk_get(np, 2);
> > +       if (!IS_ERR(typeo_clk))
> > +               pwm_typeo_freq = clk_get_rate(typeo_clk);
>
> This doesn't make any sense. Did you test this code?
>
> > +
> > +       err = of_property_read_u32(np, "pwm_typem_period", &period);
> > +       if (!err) {
> > +               success = set_clock_values(pwm_typem_freq, period,
> TYPEM, base);
> > +               if (!success)
> > +                       return -EINVAL;
> > +       } else {
> > +               return -EINVAL;
> > +       }
> > +
> > +       err = of_property_read_u32(np, "pwm_typen_period", &period);
> > +       if (!err) {
> > +               success = set_clock_values(pwm_typen_freq, period,
> TYPEN, base);
> > +               if (!success)
> > +                       return -EINVAL;
> > +       }
> > +
> > +       err = of_property_read_u32(np, "pwm_typeo_period", &period);
> > +       if (!err) {
> > +               success = set_clock_values(pwm_typeo_freq, period,
> TYPEO, base);
> > +               if (!success)
> > +                       return -EINVAL;
> > +       }
> > +
> > +       for_each_child_of_node(np, child) {
> > +               aspeed_create_pwm_port(&pdev->dev,
> > +                               child, base);
> > +               of_node_put(child);
> > +       }
> > +       of_node_put(np);
> > +
> > +       return 0;
> > +}
>

--001a1147286caf6b4d0542a1a6c7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sun, Nov 27, 2016 at 10:13 PM, Joel Stanley <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:joel@jms.id.au" target=3D"_blank">joel@jms.id.au</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Jagh=
u,<br>
<br>
This is looking better. I have some more comments below.<br>
<span class=3D"gmail-"><br>
On Thu, Nov 24, 2016 at 7:56 PM, Jaghathiswari Rankappagounder<br>
Natarajan &lt;<a href=3D"mailto:jaghu@google.com">jaghu@google.com</a>&gt; =
wrote:<br>
<br>
&gt; +The ASPEED AST2400/2500 PWM controller supports 8 PWM output ports.<b=
r>
&gt; +PWM clock types M, N and 0 are three types just to have three indepen=
dent PWM<br>
&gt; +sources. Each port can be assigned a different PWM clock type.<br>
<br>
</span>I suggest you describe the types.<br>
<br>
And add some newlines between your paragraphs to make it easier to read.<br=
>
<span class=3D"gmail-"><br>
&gt; +The device driver matches on the device tree node. The configuration =
values<br>
&gt; +are read from the device tree and written to the respective registers=
.<br>
&gt; +The driver provides a sysfs entry &quot;pwm1&quot; through which the =
user can<br>
&gt; +configure the duty-cycle value (ranging from 0 to 255; 255 is 100 per=
cent).<br>
&gt; diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig<br>
&gt; index d4de8d5..7f75b01 100644<br>
&gt; --- a/drivers/hwmon/Kconfig<br>
&gt; +++ b/drivers/hwmon/Kconfig<br>
&gt; @@ -341,6 +341,19 @@ config SENSORS_ASB100<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built =
as a module.=C2=A0 If so, the module<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called asb100.<br>
&gt;<br>
&gt; +config SENSORS_ASPEED_PWM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tristate &quot;ASPEED AST2400/AST2500 PWM =
driver&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver provides support for AS=
PEED AST2400/AST2500 PWM<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0controller and output ports. The AS=
PEED PWM controller can support 8<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PWM outputs. PWM clock types M, N a=
nd 0 are three types just to have three<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0independent PWM sources. Each could=
 be assigned to the 8 PWM port<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with its own settings. The user can=
 configure duty cycle through<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the exposed hwmon sysfs entry &quot=
;pwm&quot;.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This driver can also be built as a =
module.=C2=A0 If so, the module<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0will be called aspeed-pwm.<br>
<br>
</span>Make sure you test the code both as a module and built in to the ker=
nel.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +struct aspeed_pwm_port_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_port;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_enable;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_type;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 pwm_fan_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum pwm_clock_type { TYPEM, TYPEN, TYPEO };<br>
&gt; +<br>
&gt; +struct pwm_clock_type_params {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 l_value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 l_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 h_value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 h_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 unit_value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 unit_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_reg_offset;<br>
<br>
</span>ctrl_reg or even just ctrl will do.<br>
<br>
&gt; +};<br>
&gt; +<br>
<br>
I think this is an improvement on the duplicated swtich statements we<br>
had before. Do you agree?<br>
<br>
I&#39;m wondering if there are still ways to clean up. The mask and the<br>
value both tell us where in the register each value needs to go;<br>
perhaps we can only include one of them in the pwm_clock_type_params?<br>
<div><div class=3D"gmail-h5"><br>
&gt; +static const struct pwm_clock_type_params pwm_clock_type_params[] =3D=
 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[TYPEM] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEM_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEM_L_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEM_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEM_H_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_value =
=3D ASPEED_PTCR_CLK_CTRL_TYPEM_<wbr>UNIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_mask =3D=
 ASPEED_PTCR_CLK_CTRL_TYPEM_<wbr>UNIT_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ctrl_reg_offs=
et =3D ASPEED_PTCR_CLK_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[TYPEN] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEN_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEN_L_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEN_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEN_H_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_value =
=3D ASPEED_PTCR_CLK_CTRL_TYPEN_<wbr>UNIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_mask =3D=
 ASPEED_PTCR_CLK_CTRL_TYPEN_<wbr>UNIT_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ctrl_reg_offs=
et =3D ASPEED_PTCR_CLK_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[TYPEO] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEO_L,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.l_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEO_L_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_value =3D A=
SPEED_PTCR_CLK_CTRL_TYPEO_H,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.h_mask =3D AS=
PEED_PTCR_CLK_CTRL_TYPEO_H_<wbr>MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_value =
=3D ASPEED_PTCR_CLK_CTRL_TYPEO_<wbr>UNIT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.unit_mask =3D=
 ASPEED_PTCR_CLK_CTRL_TYPEO_<wbr>UNIT_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ctrl_reg_offs=
et =3D ASPEED_PTCR_CLK_CTRL_EXT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +};<br>
&gt; +<br>
&gt; +enum pwm_port { PWMA, PWMB, PWMC, PWMD, PWME, PWMF, PWMG, PWMH };<br>
&gt; +<br>
&gt; +struct pwm_port_params {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pwm_en;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 ctrl_reg_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pwm_type_part1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pwm_type_part2;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pwm_type_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 duty_ctrl_rise_point;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 duty_ctrl_fall_point;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 duty_ctrl_reg_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 duty_ctrl_calc_type;<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const struct pwm_port_params pwm_port_params[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[PWMA] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pwm_en =3D AS=
PEED_PTCR_CTRL_PWMA_EN,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.ctrl_reg_offs=
et =3D ASPEED_PTCR_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pwm_type_part=
1 =3D ASPEED_PTCR_CTRL_SET_PWMA_<wbr>TYPE_PART1,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pwm_type_part=
2 =3D ASPEED_PTCR_CTRL_SET_PWMA_<wbr>TYPE_PART2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.pwm_type_mask=
 =3D ASPEED_PTCR_CTRL_SET_PWMA_<wbr>TYPE_MASK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.duty_ctrl_ris=
e_point =3D DUTY_CTRL_PWM1_RISE_POINT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.duty_ctrl_fal=
l_point =3D DUTY_CTRL_PWM1_FALL_POINT,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.duty_ctrl_reg=
_offset =3D ASPEED_PTCR_DUTY0_CTRL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.duty_ctrl_cal=
c_type =3D 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0},<br>
&gt; +<br>
</div></div><span class=3D"gmail-">&gt; +static inline void<br>
&gt; +aspeed_pwm_write(void __iomem *base, u32 val, u32 reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0writel(val, base + reg);<br>
<br>
</span>Is there a reason you&#39;re using writel and not iowrite32?<br>
<span class=3D"gmail-"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static inline u32<br>
&gt; +aspeed_pwm_read(void __iomem *base, u32 reg)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 val =3D readl(base + reg);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return val;<br>
<br>
</span>You could just do return readl(base + reg).<br>
<br>
That said, do you think the helpers for _read and _write are worth it?<br>
<span class=3D"gmail-"><br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +aspeed_set_pwm_clock_enable(<wbr>void __iomem *base, bool val)<br>
<br>
</span>Most kernel code puts the type and storage class specifiers on the<b=
r>
same line as the function:<br>
<br>
static void aspeed_set_pwm_clock_enable(<wbr>void __iomem *base, bool val)<=
br>
<span class=3D"gmail-"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_value =3D aspeed_pwm_read(base, AS=
PEED_PTCR_CTRL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value |=3D=
 ASPEED_PTCR_CTRL_CLK_EN;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value &amp=
;=3D ~ASPEED_PTCR_CTRL_CLK_EN;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg_value, ASPEED_P=
TCR_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +aspeed_set_pwm_clock_source(<wbr>void __iomem *base, bool val)<br>
<br>
</span>When I call this function I&#39;m going to write something like this=
:<br>
<br>
aspeed_set_pwm_clock_source(<wbr>foo, true);<br>
<br>
It doesn&#39;t make sense to be setting a clock source to &quot;true&quot;.=
 I think<br>
you could call it aspeed_pwm_use_pclk() or similar, so the boolean<br>
makes sense.<br>
<div><div class=3D"gmail-h5"><br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_value =3D aspeed_pwm_read(base, AS=
PEED_PTCR_CTRL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (val)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value |=3D=
 ASPEED_PTCR_CTRL_CLK_SRC;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value &amp=
;=3D ~ASPEED_PTCR_CTRL_CLK_SRC;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg_value, ASPEED_P=
TCR_CTRL);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +aspeed_set_pwm_clock_<wbr>division_h(void __iomem *base, u8 pwm_clock=
_type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 div_high)<b=
r>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_offset =3D pwm_clock_type_params[p=
wm_<wbr>clock_type].ctrl_reg_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_value =3D aspeed_pwm_read(base, re=
g_offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value &amp;=3D ~pwm_clock_type_params[=
pwm_<wbr>clock_type].h_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value |=3D div_high &lt;&lt; pwm_clock=
_type_params[pwm_<wbr>clock_type].h_value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg_value, reg_offs=
et);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static void<br>
&gt; +aspeed_set_pwm_clock_<wbr>division_l(void __iomem *base, u8 pwm_clock=
_type,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 div_low)<br=
>
&gt; +{<br>
<br>
</div></div>You could pass around a pointer to the clock type, instead of t=
he index.<br>
<br>
Even better would be some kind of struct that includes both base and<br>
the clock type.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_offset =3D pwm_clock_type_params[p=
wm_<wbr>clock_type].ctrl_reg_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_value =3D aspeed_pwm_read(base, re=
g_offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value &amp;=3D ~pwm_clock_type_params[=
pwm_<wbr>clock_type].l_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value |=3D div_low &lt;&lt; pwm_clock_=
type_params[pwm_<wbr>clock_type].l_value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg_value, reg_offs=
et);<br>
&gt; +}<br>
<br>
</span>Is there ever a case where you will set the high but not the low bit=
?<br>
If not you could do this:<br>
<br>
aspeed_set_pwm_clock_division(<wbr>void __iomem *base, u8 pwm_clock_type,<b=
r>
u8 div_low, u8 div_high)<br>
{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0struct pwm_clock_type *pwm =3D &amp;pwm_clock_ty=
pe_params[pwm_<wbr>clock_type];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg =3D aspeed_pwm_read(base, pwm-&gt;ctrl_r=
eg_offset);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0reg &amp;=3D ~(pwm-&gt;l_mask | pwm-&gt;h_mask);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0reg |=3D (div_low &lt;&lt; pwm-&gt;l_value) | (d=
iv_high &lt;&lt; pwm-&gt;h_value);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg, pwm-&gt;ctrl_reg_off=
set);<br>
}<br>
<br>
I suggest attempting cleanups like this to other parts of your code.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +static void<br>
&gt; +aspeed_set_pwm_clock_unit(<wbr>void __iomem *base, u8 pwm_clock_type,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u8 unit)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_offset =3D pwm_clock_type_params[p=
wm_<wbr>clock_type].ctrl_reg_offset;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 reg_value =3D aspeed_pwm_read(base, re=
g_offset);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value &amp;=3D ~pwm_clock_type_params[=
pwm_<wbr>clock_type].unit_mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0reg_value |=3D unit &lt;&lt; pwm_clock_typ=
e_params[pwm_<wbr>clock_type].unit_value;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_pwm_write(base, reg_value, reg_offs=
et);<br>
&gt; +}<br>
&gt; +<br>
<br>
&gt; +static void<br>
</span><span class=3D"gmail-">&gt; +aspeed_set_pwm_fan_ctrl(<wbr>struct asp=
eed_pwm_port_data *priv, u8 fan_ctrl)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 period;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u16 dc_time_on;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0period =3D aspeed_get_pwm_clock_unit(<wbr>=
priv, priv-&gt;pwm_type);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0period +=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0dc_time_on =3D (fan_ctrl * period) / PWM_M=
AX;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc_time_on =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm=
_enable(priv, 0);<br>
<br>
</span>Doesn&#39;t aspeed_set_pwm_enable take a boolean as the second param=
eter?<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (dc_time_on=
 =3D=3D period)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dc_time_on =3D 0;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm=
_duty_rising(<wbr>priv, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm=
_duty_falling(<wbr>priv, dc_time_on);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm=
_enable(priv, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t<br>
&gt; +set_pwm(struct device *dev, struct device_attribute *attr, const char=
 *buf,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t count)<=
br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_pwm_port_data *priv =3D dev_=
get_drvdata(dev);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 fan_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D kstrtou8(buf, 10, &amp;fan_ctrl);<=
br>
<br>
</span>If you specify 0 as the format, then users can pass their clock rate=
<br>
in as hexadecimal (not that it would make much sense...) or decimal<br>
and the sysfs file will do the correct thing.</blockquote><div>The user is =
passing the duty cycle value here (and not the clock rate).=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><div class=3D"gmail-h5">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (fan_ctrl &lt; 0 || fan_ctrl &gt; PWM_M=
AX)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (priv-&gt;pwm_fan_ctrl =3D=3D fan_ctrl)=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_fan_ctrl =3D fan_ctrl;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_fan_ctrl(priv, fan_ctrl);<b=
r>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return count;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static ssize_t<br>
&gt; +show_pwm(struct device *dev, struct device_attribute *attr, char *buf=
)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_pwm_port_data *priv =3D dev_=
get_drvdata(dev);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return sprintf(buf, &quot;%u\n&quot;, priv=
-&gt;pwm_fan_ctrl);<br>
&gt; +}<br>
&gt; +<br>
&gt; +static SENSOR_DEVICE_ATTR(pwm1, S_IRUGO | S_IWUSR, show_pwm, set_pwm,=
 0);<br>
&gt; +<br>
&gt; +static struct attribute *pwm_dev_attrs[] =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;sensor_dev_attr_pwm1.dev_<wbr>attr.at=
tr,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
&gt; +};<br>
&gt; +<br>
&gt; +ATTRIBUTE_GROUPS(pwm_dev);<br>
&gt; +<br>
&gt; +static int<br>
&gt; +aspeed_create_pwm_port(struct device *dev, struct device_node *child,=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *=
base)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device *hwmon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct aspeed_pwm_port_data *priv;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv =3D devm_kzalloc(dev, sizeof(*priv), =
GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!priv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0hwmon =3D devm_hwmon_device_register_<wbr>=
with_groups(dev, &quot;aspeed_pwm&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0priv, pwm_dev_groups);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hwmon)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_err(dev, &=
quot;Failed to register hwmon device\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return PTR_ERR=
(hwmon);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;base =3D base;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_port&=
quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_port =3D val;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_enabl=
e&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_enable =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_enable(priv, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_type&=
quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_type =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_type(priv, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_property_read_u8(child, &quot;pwm_fan_c=
trl&quot;, &amp;val);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0priv-&gt;pwm_fan_ctrl =3D val;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_fan_ctrl(priv, val);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * If the clock type is type M then :<br>
&gt; + * The PWM frequency =3D 24MHz / (type M clock division L bit *<br>
&gt; + * type M clock division H bit * (type M PWM period bit + 1))<br>
&gt; + * Calculate type M clock division L bit and H bits given the other v=
alues<br>
&gt; + */<br>
&gt; +static bool<br>
&gt; +set_clock_values(u32 pwm_frequency, u32 period, u8 type, void __iomem=
 *base)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 src_frequency =3D 24000000;<br>
<br>
</div></div>Where does this come from? It&#39;s the pclk I think. This mean=
s your<br>
binding should do something like this:<br>
<br>
=C2=A0 clocks =3D &lt;&amp;clk_apb&gt;;<br>
<br>
Then in your code,<br>
<br>
pclk =3D devm_clk_get(&amp;pdev-&gt;dev, NULL);<br>
pclk_rate =3D clk_get_rate(pclk);<br>
<br>
and then use clck_rate where you have &#39;src_frequency&#39; to calculate =
the<br>
divisor values. A hwmon driver that does this is g762.c.</blockquote><div>F=
or the PWM and Fan Tach controller, in the register PTCR00 (AST2500 datashe=
et page - 671) it is given as :=C2=A0</div><div><br></div><div>Clock source=
 selection=C2=A0</div><div>0: from 24MHz=C2=A0</div><div>1: from MCLK<br></=
div><div><br></div><div>24MHz seems to be hardcoded. I am not sure which cl=
ock producer to use</div><div>for 24MHz and for MCLK.</div><div><br></div><=
div>CLKIN seems to have the option of being either 24MHz and 25 MHz.</div><=
div><br></div><div>I am not sure how the pclk is related here.=C2=A0</div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><div=
 class=3D"gmail-h5">
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 divisor =3D src_frequency / pwm_freque=
ncy;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 clock_divisor =3D divisor / (period + =
1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 tmp_clock_divisor;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 low;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u8 high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 calc_high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 calc_low;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for (high =3D 0; high &lt;=3D MAX_HIGH_LOW=
_BIT; high +=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (low =3D 0=
; low &lt;=3D MAX_HIGH_LOW_BIT; low +=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0calc_high =3D 0x1 &lt;&lt; high;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0calc_low =3D (low =3D=3D 0 ? 1 : (2 * low));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0tmp_clock_divisor =3D calc_high * calc_low;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0if (tmp_clock_divisor &gt;=3D clock_divisor)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto set_value;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
&gt; +<br>
&gt; +set_value:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_clock_division_<wbr>h(base,=
 type, high);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_clock_division_<wbr>l(base,=
 type, low);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_clock_unit(<wbr>base, type,=
 period);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return true;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int<br>
&gt; +aspeed_pwm_probe(struct platform_device *pdev)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 period;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct device_node *np, *child;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem *base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0bool success;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk *typem_clk, *typen_clk, *typeo_=
clk;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 pwm_typem_freq, pwm_typen_freq, pwm_ty=
peo_freq;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0np =3D pdev-&gt;dev.of_node;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D platform_get_resource(pdev, IORESO=
URCE_MEM, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (res =3D=3D NULL)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOENT=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0base =3D devm_ioremap(&amp;pdev-&gt;dev, r=
es-&gt;start, resource_size(res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENOMEM=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Enable PWM clock */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_clock_enable(<wbr>base, 1);=
<br>
<br>
</div></div>You&#39;re passing a &#39;1&#39; to a function that expects a b=
oolean value.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Select clock source as 24MHz */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_set_pwm_clock_source(<wbr>base, 0);=
<br>
<br>
</span>This would be selected by your device tree bindings. You could have =
it<br>
so if a clock node is populated, it uses that value, and if it&#39;s not<br=
>
it falls back on the 1MHz clock.<br>
<span class=3D"gmail-"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typem_clk =3D of_clk_get(np, 0);<br>
<br>
</span>This isn&#39;t what I meant. See the comment above about referencing=
 the<br>
parent clock in the bindings.<br>
<span class=3D"gmail-"><br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(typem_clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_typem_freq=
 =3D clk_get_rate(typem_clk);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typen_clk =3D of_clk_get(np, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(typen_clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_typen_freq=
 =3D clk_get_rate(typen_clk);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0typeo_clk =3D of_clk_get(np, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!IS_ERR(typeo_clk))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pwm_typeo_freq=
 =3D clk_get_rate(typeo_clk);<br>
<br>
</span>This doesn&#39;t make any sense. Did you test this code?<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32(np, &quot;pwm=
_typem_period&quot;, &amp;period);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success =3D se=
t_clock_values(pwm_typem_<wbr>freq, period, TYPEM, base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!success)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32(np, &quot;pwm=
_typen_period&quot;, &amp;period);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success =3D se=
t_clock_values(pwm_typen_<wbr>freq, period, TYPEN, base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!success)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0err =3D of_property_read_u32(np, &quot;pwm=
_typeo_period&quot;, &amp;period);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!err) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0success =3D se=
t_clock_values(pwm_typeo_<wbr>freq, period, TYPEO, base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!success)<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0return -EINVAL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0for_each_child_of_node(np, child) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0aspeed_create_=
pwm_port(&amp;pdev-&gt;<wbr>dev,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child, base);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(ch=
ild);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0of_node_put(np);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
&gt; +}<br>
</div></div></blockquote></div><br></div></div>

--001a1147286caf6b4d0542a1a6c7--
