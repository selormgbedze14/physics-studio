// lib/data/physics_data.dart
import '../models/models.dart';

// ═══════════════════════════════════════════════════
// CHAPTERS
// ═══════════════════════════════════════════════════
final List<Chapter> physicsChapters = [
  Chapter(
    id: 1,
    title: 'Kinematics — Motion in 1D',
    icon: '🏃',
    color: '#58A6FF',
    topics: [
      Topic(
        id: 'ch1-displacement',
        title: 'Displacement, Velocity & Speed',
        sections: [
          Section(
            title: 'Reference Frames & Displacement',
            content: '''
## Reference Frames

All motion is described **relative to a reference frame** — a coordinate system from which measurements are made. A common choice is the ground as the reference frame with a defined positive direction.

**Displacement** is the change in position of an object:

> Δx = x_f − x_i

Displacement is a **vector** — it has both magnitude and direction. It is **not** the same as distance (scalar).

**Example:** A car travels 5 km east, then 3 km west.
- Distance = 8 km
- Displacement = 2 km east

## Average Speed vs Average Velocity

| Quantity | Formula | Type |
|---|---|---|
| Average speed | d / t | Scalar |
| Average velocity | Δx / Δt | Vector |

Average velocity can be zero even if the object has moved (if it returns to start).
''',
            formulas: [
              Formula(
                name: 'Displacement',
                expression: 'Δx = x_f − x_i',
                variables: 'Δx = displacement (m), x_f = final position, x_i = initial position',
              ),
              Formula(
                name: 'Average Velocity',
                expression: 'v_avg = Δx / Δt',
                variables: 'v_avg = average velocity (m/s), Δx = displacement (m), Δt = time interval (s)',
                example: 'Car moves 100 m in 5 s → v_avg = 100/5 = 20 m/s',
              ),
            ],
          ),
          Section(
            title: 'Acceleration',
            content: '''
## Acceleration

Acceleration is the **rate of change of velocity**. Like velocity, it is a vector.

> a = Δv / Δt = (v_f − v_i) / Δt

**Positive acceleration:** velocity increasing in positive direction (or decreasing in negative direction)
**Negative acceleration (deceleration):** velocity decreasing in positive direction

## The Kinematic Equations

For **constant acceleration only**, these four equations relate displacement, velocity, acceleration, and time:

| Equation | Missing variable |
|---|---|
| v = v₀ + at | Δx |
| Δx = v₀t + ½at² | v |
| v² = v₀² + 2aΔx | t |
| Δx = ½(v₀ + v)t | a |

> 💡 **Exam Tip:** Identify the 3 known variables and 1 unknown, then choose the equation that contains only those 4 quantities.
''',
            formulas: [
              Formula(
                name: 'Average Acceleration',
                expression: 'a = Δv / Δt = (v_f − v_i) / Δt',
                variables: 'a = acceleration (m/s²), v_f = final velocity, v_i = initial velocity, Δt = time (s)',
              ),
              Formula(
                name: 'Kinematic Eq. 1',
                expression: 'v = v₀ + at',
                variables: 'v = final velocity, v₀ = initial velocity, a = acceleration, t = time',
                example: 'v₀=0, a=9.8 m/s², t=3s → v = 0 + 9.8×3 = 29.4 m/s',
              ),
              Formula(
                name: 'Kinematic Eq. 2',
                expression: 'Δx = v₀t + ½at²',
                variables: 'Δx = displacement, v₀ = initial velocity, a = acceleration, t = time',
              ),
              Formula(
                name: 'Kinematic Eq. 3',
                expression: 'v² = v₀² + 2aΔx',
                variables: 'v = final velocity, v₀ = initial velocity, a = acceleration, Δx = displacement',
              ),
            ],
          ),
          Section(
            title: 'Free Fall',
            content: '''
## Free Fall

An object in **free fall** accelerates downward at **g = 9.8 m/s²** (near Earth's surface), ignoring air resistance.

All objects fall at the **same rate** regardless of mass — confirmed by Galileo and the equivalence principle.

**Sign convention (taking down as negative):**
- a = −9.8 m/s² (or −g)
- Initial velocity upward: v₀ = positive
- At maximum height: v = 0

## Worked Example

A ball is thrown upward at 20 m/s. Find:
(a) Maximum height
(b) Time to reach maximum height
(c) Total time in air

**(a)** v² = v₀² + 2aΔx → 0 = 400 + 2(−9.8)Δx → **Δx = 20.4 m**

**(b)** v = v₀ + at → 0 = 20 − 9.8t → **t = 2.04 s**

**(c)** Total time = 2 × 2.04 = **4.08 s** (symmetric trajectory)
''',
            formulas: [
              Formula(
                name: 'Gravitational acceleration',
                expression: 'g = 9.8 m/s² ≈ 10 m/s²',
                variables: 'g = acceleration due to gravity near Earth\'s surface',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 2,
    title: "Newton's Laws of Motion",
    icon: '⚙️',
    color: '#3FB950',
    topics: [
      Topic(
        id: 'ch2-newtons-laws',
        title: "Newton's Three Laws",
        sections: [
          Section(
            title: "Newton's First Law — Inertia",
            content: '''
## Newton's First Law (Law of Inertia)

> **An object at rest remains at rest, and an object in motion continues in motion with the same speed and in the same direction unless acted upon by a net external force.**

**Inertia** is the tendency of an object to resist changes in its state of motion. Inertia is related to mass — greater mass = greater inertia.

**Key insight:** A net force of **zero** does NOT mean no forces are acting. It means all forces **balance** each other. An object with zero net force has zero acceleration (but may have constant velocity).

## Inertial Reference Frames

Newton's first law defines **inertial reference frames** — frames in which objects move with constant velocity when no net force acts. Non-inertial frames (accelerating) require pseudo-forces.
''',
          ),
          Section(
            title: "Newton's Second Law — F = ma",
            content: '''
## Newton's Second Law

> **The acceleration of an object is directly proportional to the net force acting on it and inversely proportional to its mass.**

The net force (ΣF) equals the vector sum of ALL forces acting on the object.

**Free Body Diagrams (FBDs):**
1. Draw the object as a point (or box)
2. Draw ALL forces as arrows from the centre
3. Label each force with its type and magnitude
4. Choose a coordinate system

## Common Forces

| Force | Symbol | Notes |
|---|---|---|
| Weight | W = mg | Always downward |
| Normal | N | Perpendicular to surface |
| Friction | f = μN | Opposes motion |
| Tension | T | Along the string/rope |
| Applied | F_app | Direction varies |

> ⚠️ **Weight ≠ Mass.** Weight is a force (Newtons); mass is a property (kg).
''',
            formulas: [
              Formula(
                name: "Newton's 2nd Law",
                expression: 'ΣF = ma',
                variables: 'ΣF = net force (N), m = mass (kg), a = acceleration (m/s²)',
                example: 'F=50 N, m=10 kg → a = 50/10 = 5 m/s²',
              ),
              Formula(
                name: 'Weight',
                expression: 'W = mg',
                variables: 'W = weight (N), m = mass (kg), g = 9.8 m/s²',
                example: 'm=70 kg → W = 70 × 9.8 = 686 N',
              ),
              Formula(
                name: 'Friction Force',
                expression: 'f = μN',
                variables: 'f = friction force (N), μ = coefficient of friction, N = normal force (N)',
              ),
            ],
          ),
          Section(
            title: "Newton's Third Law — Action-Reaction",
            content: '''
## Newton's Third Law

> **If object A exerts a force on object B, then object B exerts an equal and opposite force on object A.**

These **action-reaction pairs** always:
- Are equal in magnitude
- Are opposite in direction
- Act on **different** objects (crucial!)
- Are the same type of force

**Common mistake:** Action-reaction pairs do NOT cancel each other because they act on **different** objects. Forces cancel only when they act on the **same** object.

## Example: Horse and Cart Paradox

The horse pulls the cart with force F forward.
The cart pulls the horse backward with force F.
Why does the system accelerate?

The horse pushes on the **ground** backward; the ground pushes the horse **forward** (reaction). If this friction force on the horse is greater than the tension (cart resisting), the system accelerates forward.
''',
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 3,
    title: 'Momentum & Collisions',
    icon: '💥',
    color: '#BC8CFF',
    topics: [
      Topic(
        id: 'ch3-momentum',
        title: 'Momentum, Impulse & Conservation',
        sections: [
          Section(
            title: 'Linear Momentum & Impulse',
            content: '''
## Linear Momentum

**Momentum** is the product of mass and velocity. It is a vector quantity.

> p = mv

The **impulse-momentum theorem** connects force and change in momentum:

> J = FΔt = Δp = m(v_f − v_i)

**Impulse** (J) is the product of average force and time interval. It equals the change in momentum.

**Practical significance:** A large force applied for a short time produces the same change in momentum as a small force for a long time. Safety devices (airbags, crumple zones) work by **increasing the time** of collision → reducing peak force on passengers.
''',
            formulas: [
              Formula(
                name: 'Momentum',
                expression: 'p = mv',
                variables: 'p = momentum (kg·m/s), m = mass (kg), v = velocity (m/s)',
              ),
              Formula(
                name: 'Impulse-Momentum Theorem',
                expression: 'J = FΔt = Δp = m(v_f − v_i)',
                variables: 'J = impulse (N·s), F = force (N), Δt = time (s), Δp = change in momentum',
                example: 'F=100N, Δt=0.5s → J=50 N·s',
              ),
            ],
          ),
          Section(
            title: 'Conservation of Momentum',
            content: '''
## Law of Conservation of Momentum

> **The total momentum of a closed system is constant if no external forces act.**

> p_total before = p_total after

> m₁v₁ᵢ + m₂v₂ᵢ = m₁v₁f + m₂v₂f

**Elastic collision:** Both momentum AND kinetic energy are conserved.
**Inelastic collision:** Only momentum is conserved. KE is lost (as heat, sound, deformation).
**Perfectly inelastic:** Objects stick together after collision. Maximum KE loss.

## Worked Example

Car A (m=1000 kg, v=20 m/s) collides with stationary Car B (m=1500 kg). They stick together. Find final velocity.

m₁v₁ = (m₁ + m₂)v_f
1000 × 20 = 2500 × v_f
v_f = 20000 / 2500 = **8 m/s**
''',
            formulas: [
              Formula(
                name: 'Conservation of Momentum',
                expression: 'm₁v₁ᵢ + m₂v₂ᵢ = m₁v₁f + m₂v₂f',
                variables: 'm = masses (kg), v = velocities (m/s), i = initial, f = final',
              ),
              Formula(
                name: 'Perfectly Inelastic Collision',
                expression: 'm₁v₁ + m₂v₂ = (m₁+m₂)v_f',
                variables: 'Objects stick together; find common final velocity v_f',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 4,
    title: 'Work, Energy & Power',
    icon: '⚡',
    color: '#D29922',
    topics: [
      Topic(
        id: 'ch4-energy',
        title: 'Work, KE, PE & Conservation',
        sections: [
          Section(
            title: 'Work and the Work-Energy Theorem',
            content: '''
## Work

**Work** is done when a force causes displacement. Work is a **scalar**.

> W = F·d·cos θ

where θ is the angle between the force and displacement.

- Force parallel to motion: W = Fd (θ=0°, maximum)
- Force perpendicular to motion: W = 0 (θ=90°)
- Force opposing motion: W negative (θ=180°)

**Unit:** Joule (J) = Newton·metre (N·m)

## Work-Energy Theorem

> **The net work done on an object equals its change in kinetic energy.**

> W_net = ΔKE = ½mv_f² − ½mv_i²

This is one of the most powerful tools in mechanics — often much easier than using F=ma with kinematics.
''',
            formulas: [
              Formula(
                name: 'Work',
                expression: 'W = Fd cosθ',
                variables: 'W = work (J), F = force (N), d = displacement (m), θ = angle between F and d',
                example: 'F=50N, d=10m, θ=30° → W = 50×10×cos30° = 433 J',
              ),
              Formula(
                name: 'Kinetic Energy',
                expression: 'KE = ½mv²',
                variables: 'KE = kinetic energy (J), m = mass (kg), v = velocity (m/s)',
              ),
              Formula(
                name: 'Work-Energy Theorem',
                expression: 'W_net = ΔKE = ½mv_f² − ½mv_i²',
                variables: 'W_net = total work done (J)',
              ),
            ],
          ),
          Section(
            title: 'Potential Energy & Conservation of Energy',
            content: '''
## Gravitational Potential Energy

> PE_grav = mgh

where h is measured from an **arbitrary reference level** (usually ground).

## Conservation of Mechanical Energy

If only **conservative forces** act (gravity, springs — not friction):

> KE_i + PE_i = KE_f + PE_f
> ½mv_i² + mgh_i = ½mv_f² + mgh_f

**When friction is present:**
> KE_i + PE_i = KE_f + PE_f + W_friction

## Power

> P = W / t = Fv

Power is the **rate** of doing work. Unit: Watt (W) = J/s
''',
            formulas: [
              Formula(
                name: 'Gravitational PE',
                expression: 'PE = mgh',
                variables: 'PE = potential energy (J), m = mass (kg), g = 9.8 m/s², h = height (m)',
              ),
              Formula(
                name: 'Conservation of Energy',
                expression: 'KE_i + PE_i = KE_f + PE_f',
                variables: 'Valid when only conservative forces act',
                example: 'Ball dropped from 10m: v = √(2×9.8×10) = 14 m/s at ground',
              ),
              Formula(
                name: 'Power',
                expression: 'P = W/t = Fv',
                variables: 'P = power (W), W = work (J), t = time (s), v = velocity (m/s)',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 5,
    title: 'Waves & Sound',
    icon: '🌊',
    color: '#FF7B72',
    topics: [
      Topic(
        id: 'ch5-waves',
        title: 'Wave Properties & Sound',
        sections: [
          Section(
            title: 'Types of Waves & Wave Properties',
            content: '''
## Types of Waves

**Transverse waves:** Particles vibrate perpendicular to wave direction.
- Examples: light, EM waves, waves on a string

**Longitudinal waves:** Particles vibrate parallel to wave direction.
- Examples: sound, seismic P-waves

## Wave Properties

| Property | Symbol | Unit | Description |
|---|---|---|---|
| Wavelength | λ | m | Distance between successive crests |
| Frequency | f | Hz | Oscillations per second |
| Period | T | s | Time for one oscillation |
| Amplitude | A | m | Maximum displacement from equilibrium |
| Wave speed | v | m/s | Speed of energy transfer |

## The Wave Equation

> v = fλ

Since T = 1/f:
> v = λ/T

**For sound in air at 20°C:** v ≈ 343 m/s
**For light in vacuum:** c = 3.0 × 10⁸ m/s
''',
            formulas: [
              Formula(
                name: 'Wave Speed',
                expression: 'v = fλ',
                variables: 'v = wave speed (m/s), f = frequency (Hz), λ = wavelength (m)',
                example: 'f=440 Hz (A note), v=343 m/s → λ = 343/440 = 0.78 m',
              ),
              Formula(
                name: 'Period-Frequency',
                expression: 'T = 1/f',
                variables: 'T = period (s), f = frequency (Hz)',
              ),
            ],
          ),
          Section(
            title: 'Sound & the Doppler Effect',
            content: '''
## Sound Intensity

Sound intensity is power per unit area:
> I = P / A

Intensity follows an **inverse square law** with distance:
> I ∝ 1/r²

## Sound Level (Decibels)
> β = 10 log₁₀(I / I₀) dB

where I₀ = 10⁻¹² W/m² (threshold of hearing)

## Doppler Effect

When source and observer are in **relative motion**, the observed frequency differs from the source frequency.

> f_obs = f_source × (v ± v_observer) / (v ∓ v_source)

**Rules:** 
- Upper signs when moving **toward** each other (higher pitch)
- Lower signs when moving **away** (lower pitch)

**Applications:** Radar speed guns, medical ultrasound, astronomy (redshift), echolocation.
''',
            formulas: [
              Formula(
                name: 'Doppler Effect',
                expression: 'f_obs = f_s × (v ± v_o) / (v ∓ v_s)',
                variables: 'f_obs = observed frequency, f_s = source frequency, v = speed of sound, v_o = observer speed, v_s = source speed',
              ),
              Formula(
                name: 'Sound Intensity',
                expression: 'I = P/A  (W/m²)',
                variables: 'P = power (W), A = area (m²)',
              ),
              Formula(
                name: 'Decibels',
                expression: 'β = 10 log(I/I₀) dB',
                variables: 'I₀ = 10⁻¹² W/m² (reference intensity)',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 6,
    title: 'Electricity & Circuits',
    icon: '🔋',
    color: '#39D353',
    topics: [
      Topic(
        id: 'ch6-circuits',
        title: "Ohm's Law & Circuit Analysis",
        sections: [
          Section(
            title: "Electric Current, Voltage & Ohm's Law",
            content: '''
## Electric Current

**Current** is the rate of flow of electric charge:
> I = ΔQ / Δt

Unit: Ampere (A). Conventional current flows from + to − (opposite to electron flow).

## Voltage (Potential Difference)

**Voltage** is the work done per unit charge to move charge between two points:
> V = W / Q

Unit: Volt (V) = J/C

## Ohm's Law

> V = IR

**Resistance** (R, unit: Ω) is a measure of how much a material opposes current flow.

**Ohmic materials:** R is constant (independent of V and I) — e.g. metal resistors at constant temperature.
**Non-ohmic:** R varies (e.g. diodes, filament bulbs, transistors).

## Resistivity
> R = ρL / A

where ρ = resistivity (Ω·m), L = length, A = cross-sectional area.
''',
            formulas: [
              Formula(
                name: 'Electric Current',
                expression: 'I = ΔQ/Δt',
                variables: 'I = current (A), Q = charge (C), t = time (s)',
              ),
              Formula(
                name: "Ohm's Law",
                expression: 'V = IR',
                variables: 'V = voltage (V), I = current (A), R = resistance (Ω)',
                example: 'V=12V, R=4Ω → I = 12/4 = 3 A',
              ),
            ],
          ),
          Section(
            title: 'Series & Parallel Circuits',
            content: '''
## Series Circuits

Components connected in a **single path**. Same current through all.

- Total resistance: **R_total = R₁ + R₂ + R₃ + ...**
- Voltage divides: V₁/V₂ = R₁/R₂
- Total voltage: V = V₁ + V₂ + ...

## Parallel Circuits

Components share the **same voltage**. Current splits.

- **1/R_total = 1/R₁ + 1/R₂ + 1/R₃ + ...**
- For two resistors: R_total = R₁R₂/(R₁+R₂)
- Current divides: I₁/I₂ = R₂/R₁

## Electric Power

> P = IV = I²R = V²/R

**Energy** consumed: E = Pt = IVt

> ⚡ **Tip:** Household appliances are rated in watts (power) at a given voltage. P = V²/R lets you find resistance from the rating.
''',
            formulas: [
              Formula(
                name: 'Series Resistance',
                expression: 'R_total = R₁ + R₂ + R₃',
                variables: 'All resistances in series add directly',
              ),
              Formula(
                name: 'Parallel Resistance',
                expression: '1/R_total = 1/R₁ + 1/R₂ + 1/R₃',
                variables: 'For parallel resistors; or R_total = R₁R₂/(R₁+R₂) for two',
              ),
              Formula(
                name: 'Electric Power',
                expression: 'P = IV = I²R = V²/R',
                variables: 'P = power (W), I = current (A), V = voltage (V), R = resistance (Ω)',
                example: '60W bulb on 240V: R = 240²/60 = 960 Ω',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 7,
    title: 'Thermal Physics',
    icon: '🌡️',
    color: '#F85149',
    topics: [
      Topic(
        id: 'ch7-thermal',
        title: 'Heat, Temperature & Thermodynamics',
        sections: [
          Section(
            title: 'Temperature Scales & Heat Transfer',
            content: '''
## Temperature Scales

| Scale | Freezing point | Boiling point |
|---|---|---|
| Celsius (°C) | 0° | 100° |
| Fahrenheit (°F) | 32° | 212° |
| Kelvin (K) | 273 K | 373 K |

**Conversion:**
- K = °C + 273.15
- °F = (9/5)°C + 32
- **Absolute zero** = 0 K = −273.15°C (minimum possible temperature)

## Heat Transfer Mechanisms

**Conduction:** Heat transfer through direct contact. Rate depends on thermal conductivity, area, temperature difference, and thickness.

**Convection:** Heat transfer via fluid movement. Natural (density differences) or forced.

**Radiation:** Heat transfer via electromagnetic waves (infrared). Does not require a medium. P = σεAT⁴ (Stefan-Boltzmann law).
''',
          ),
          Section(
            title: 'Specific Heat & Latent Heat',
            content: '''
## Specific Heat Capacity

> Q = mcΔT

The energy needed to raise 1 kg of a substance by 1°C (or 1 K).
- Water: c = 4,186 J/(kg·°C) — very high (moderates climate)
- Copper: c = 385 J/(kg·°C)

## Latent Heat

During a **phase change** (melting or boiling), temperature stays constant while energy is absorbed or released.

> Q = mL

- **L_f** = latent heat of fusion (melting/solidification)
- **L_v** = latent heat of vaporisation (boiling/condensation)

For water: L_f = 334,000 J/kg, L_v = 2,260,000 J/kg

## Heating Curve

Temperature vs. heat added shows:
1. Solid warming: slope = 1/(mc_solid)
2. Flat plateau at melting point (latent heat of fusion)
3. Liquid warming
4. Flat plateau at boiling point (latent heat of vaporisation)
5. Gas warming
''',
            formulas: [
              Formula(
                name: 'Heat Transfer (Temperature Change)',
                expression: 'Q = mcΔT',
                variables: 'Q = heat (J), m = mass (kg), c = specific heat capacity (J/kg·°C), ΔT = temp change (°C or K)',
                example: 'Heat 2 kg water from 20°C to 80°C: Q = 2×4186×60 = 502,320 J',
              ),
              Formula(
                name: 'Latent Heat',
                expression: 'Q = mL',
                variables: 'Q = heat (J), m = mass (kg), L = latent heat (J/kg)',
              ),
              Formula(
                name: 'Temperature Conversion',
                expression: 'T(K) = T(°C) + 273.15',
                variables: 'K = Kelvin, °C = Celsius',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 8,
    title: 'Light & Optics',
    icon: '🔭',
    color: '#79C0FF',
    topics: [
      Topic(
        id: 'ch8-optics',
        title: 'Reflection, Refraction & Lenses',
        sections: [
          Section(
            title: 'Reflection & Refraction',
            content: '''
## Law of Reflection

> θ_i = θ_r

The angle of incidence equals the angle of reflection (both measured from the **normal**).

## Refraction & Snell's Law

When light passes between media, it **bends** (refracts) because its speed changes.

> n₁ sin θ₁ = n₂ sin θ₂

**Index of refraction:** n = c/v

| Medium | n |
|---|---|
| Vacuum | 1.00 |
| Air | 1.0003 |
| Water | 1.33 |
| Glass | ~1.5 |
| Diamond | 2.42 |

**Total internal reflection:** occurs when light travels from dense to less dense medium and angle of incidence exceeds the **critical angle**.

sin θ_c = n₂/n₁ (when n₁ > n₂)

**Applications:** Optical fibres, diamonds, mirages.
''',
            formulas: [
              Formula(
                name: "Snell's Law",
                expression: 'n₁ sinθ₁ = n₂ sinθ₂',
                variables: 'n = refractive index, θ = angle from normal',
                example: 'Light into water: 1.0×sin60° = 1.33×sinθ₂ → θ₂ = 40.6°',
              ),
              Formula(
                name: 'Index of Refraction',
                expression: 'n = c/v',
                variables: 'n = refractive index, c = speed of light in vacuum, v = speed in medium',
              ),
              Formula(
                name: 'Critical Angle',
                expression: 'sinθ_c = n₂/n₁',
                variables: 'θ_c = critical angle, n₁ > n₂ (light going from dense to less dense)',
              ),
            ],
          ),
          Section(
            title: 'Lenses & the Thin Lens Equation',
            content: '''
## Converging vs Diverging Lenses

**Converging (convex) lens:** Focal point on the far side. Forms real or virtual images.

**Diverging (concave) lens:** Focal point on the near side. Always forms virtual, upright, smaller images.

## Thin Lens Equation

> 1/f = 1/d_o + 1/d_i

**Sign conventions:**
- d_o > 0 always (real object)
- d_i > 0: real image (far side of lens)
- d_i < 0: virtual image (same side as object)
- f > 0: converging lens
- f < 0: diverging lens

## Magnification

> m = −d_i / d_o = h_i / h_o

- |m| > 1: enlarged
- |m| < 1: reduced
- m > 0: upright image
- m < 0: inverted image
''',
            formulas: [
              Formula(
                name: 'Thin Lens Equation',
                expression: '1/f = 1/d_o + 1/d_i',
                variables: 'f = focal length (m), d_o = object distance (m), d_i = image distance (m)',
                example: 'f=10cm, d_o=30cm → 1/d_i = 1/10 − 1/30 = 2/30 → d_i = 15 cm',
              ),
              Formula(
                name: 'Magnification',
                expression: 'm = −d_i/d_o = h_i/h_o',
                variables: 'h_i = image height, h_o = object height',
              ),
            ],
          ),
        ],
      ),
    ],
  ),

  Chapter(
    id: 9,
    title: 'Nuclear Physics',
    icon: '⚛️',
    color: '#D2A8FF',
    topics: [
      Topic(
        id: 'ch9-nuclear',
        title: 'Atomic Structure & Radioactivity',
        sections: [
          Section(
            title: 'Atomic Structure & Nuclear Notation',
            content: '''
## The Nucleus

The nucleus contains **protons** (positive) and **neutrons** (neutral) — collectively **nucleons**. Electrons orbit in shells.

**Nuclear notation:** ᴬ_Z X

- A = mass number (protons + neutrons)
- Z = atomic number (protons)
- Neutrons = A − Z

**Isotopes:** Same Z, different A (different number of neutrons). Same chemical properties, different masses.

## The Four Fundamental Forces

| Force | Range | Relative strength |
|---|---|---|
| Strong nuclear | ~10⁻¹⁵ m | 10⁴² |
| Electromagnetic | Infinite | 10³⁸ |
| Weak nuclear | ~10⁻¹⁸ m | 10²⁵ |
| Gravity | Infinite | 1 |

The **strong nuclear force** binds nucleons together, overcoming electromagnetic repulsion between protons.
''',
          ),
          Section(
            title: 'Radioactive Decay & Half-Life',
            content: '''
## Types of Radioactive Decay

| Type | Symbol | Composition | Stopped by |
|---|---|---|---|
| Alpha (α) | ⁴₂He | 2 protons + 2 neutrons | Paper / few cm air |
| Beta-minus (β⁻) | ⁰₋₁e | Electron | Few mm aluminium |
| Gamma (γ) | γ | High-energy photon | Several cm lead |

**Alpha decay:** ᴬ_Z X → ᴬ⁻⁴_{Z-2} Y + ⁴₂He
**Beta-minus:** ᴬ_Z X → ᴬ_{Z+1} Y + ⁰₋₁e + antineutrino
(neutron converts to proton + electron)

## Half-Life

> N = N₀ × (½)ⁿ = N₀ × (½)^(t/t½)

where n = number of half-lives elapsed.

**Half-life (t½):** Time for half the radioactive nuclei to decay. Range: microseconds to billions of years.

## Worked Example

I-131 has t½ = 8 days. Starting with 800 mg, how much remains after 32 days?

n = 32/8 = 4 half-lives
N = 800 × (½)⁴ = 800/16 = **50 mg**
''',
            formulas: [
              Formula(
                name: 'Radioactive Decay',
                expression: 'N = N₀ × (½)^(t/t½)',
                variables: 'N = remaining nuclei, N₀ = initial nuclei, t = time, t½ = half-life',
                example: 'N₀=1000, t½=5yr, t=15yr → N = 1000×(½)³ = 125',
              ),
              Formula(
                name: 'Mass-Energy Equivalence',
                expression: 'E = mc²',
                variables: 'E = energy (J), m = mass (kg), c = 3×10⁸ m/s',
              ),
            ],
          ),
        ],
      ),
    ],
  ),
];

// ═══════════════════════════════════════════════════
// QUIZ QUESTIONS
// ═══════════════════════════════════════════════════
final List<QuizQuestion> allQuizQuestions = [
  // Kinematics
  QuizQuestion(
    chapterId: '1',
    question: 'A car accelerates from rest to 30 m/s in 10 s. What is its acceleration?',
    options: ['2 m/s²', '3 m/s²', '30 m/s²', '0.3 m/s²'],
    correctIndex: 1,
    explanation: 'a = Δv/Δt = (30−0)/10 = 3 m/s². Starting from rest means v₀=0.',
  ),
  QuizQuestion(
    chapterId: '1',
    question: 'A ball is dropped from rest. How far does it fall in 3 seconds? (g = 10 m/s²)',
    options: ['30 m', '45 m', '90 m', '15 m'],
    correctIndex: 1,
    explanation: 'Δx = v₀t + ½at² = 0 + ½(10)(9) = 45 m. Using g=10 m/s² and v₀=0.',
  ),
  QuizQuestion(
    chapterId: '1',
    question: 'Which quantity is a vector?',
    options: ['Speed', 'Distance', 'Displacement', 'Time'],
    correctIndex: 2,
    explanation: 'Displacement is a vector (has both magnitude and direction). Speed and distance are scalars. Time is a scalar.',
  ),
  QuizQuestion(
    chapterId: '1',
    question: 'A stone is thrown upward at 20 m/s. What is its velocity at the highest point?',
    options: ['20 m/s upward', '9.8 m/s downward', '0 m/s', '20 m/s downward'],
    correctIndex: 2,
    explanation: 'At the highest point, velocity is momentarily zero. The stone stops rising and is about to begin falling.',
  ),
  // Newton's Laws
  QuizQuestion(
    chapterId: '2',
    question: 'A 5 kg box is pushed with a net force of 20 N. What is its acceleration?',
    options: ['100 m/s²', '0.25 m/s²', '4 m/s²', '25 m/s²'],
    correctIndex: 2,
    explanation: 'a = F/m = 20/5 = 4 m/s²  (Newton\'s 2nd Law: F = ma)',
  ),
  QuizQuestion(
    chapterId: '2',
    question: 'A 70 kg person stands on a scale in an elevator accelerating upward at 2 m/s². What does the scale read? (g = 10 m/s²)',
    options: ['700 N', '840 N', '560 N', '140 N'],
    correctIndex: 1,
    explanation: 'N − mg = ma → N = m(g+a) = 70(10+2) = 840 N. Accelerating upward means apparent weight increases.',
  ),
  QuizQuestion(
    chapterId: '2',
    question: "According to Newton's 3rd Law, action-reaction pairs always:",
    options: ['Act on the same object', 'Cancel each other out', 'Act on different objects', 'Have different magnitudes'],
    correctIndex: 2,
    explanation: "Action-reaction pairs always act on DIFFERENT objects and therefore cannot cancel. Forces cancel only when they act on the SAME object.",
  ),
  // Momentum
  QuizQuestion(
    chapterId: '3',
    question: 'A 2 kg ball moving at 5 m/s collides with a stationary 3 kg ball. They stick together. What is their final speed?',
    options: ['5 m/s', '2 m/s', '3 m/s', '10 m/s'],
    correctIndex: 1,
    explanation: 'm₁v₁ = (m₁+m₂)v_f → 2×5 = 5×v_f → v_f = 2 m/s. Perfectly inelastic collision — conservation of momentum.',
  ),
  QuizQuestion(
    chapterId: '3',
    question: 'What does a larger impulse on an object mean?',
    options: ['More acceleration', 'Greater change in momentum', 'Higher velocity', 'More kinetic energy'],
    correctIndex: 1,
    explanation: 'Impulse = FΔt = Δp. Impulse equals the change in momentum. It does not necessarily mean more acceleration or higher final velocity.',
  ),
  // Work & Energy
  QuizQuestion(
    chapterId: '4',
    question: 'A 10 kg box is lifted 5 m. How much gravitational potential energy does it gain? (g = 10 m/s²)',
    options: ['50 J', '150 J', '500 J', '5 J'],
    correctIndex: 2,
    explanation: 'PE = mgh = 10 × 10 × 5 = 500 J',
  ),
  QuizQuestion(
    chapterId: '4',
    question: 'A force of 50 N is applied at 60° to the horizontal. The object moves 4 m horizontally. What work is done?',
    options: ['200 J', '100 J', '173 J', '400 J'],
    correctIndex: 1,
    explanation: 'W = Fd cosθ = 50 × 4 × cos60° = 200 × 0.5 = 100 J',
  ),
  QuizQuestion(
    chapterId: '4',
    question: 'A 1 kW motor runs for 2 hours. How much energy does it use?',
    options: ['2 kJ', '7200 kJ', '2000 J', '3600 J'],
    correctIndex: 1,
    explanation: 'E = Pt = 1000 W × 7200 s = 7,200,000 J = 7200 kJ. Remember: 2 hours = 7200 seconds.',
  ),
  // Waves
  QuizQuestion(
    chapterId: '5',
    question: 'A wave has frequency 200 Hz and wavelength 1.5 m. What is its speed?',
    options: ['133 m/s', '300 m/s', '200 m/s', '1.5 m/s'],
    correctIndex: 1,
    explanation: 'v = fλ = 200 × 1.5 = 300 m/s',
  ),
  QuizQuestion(
    chapterId: '5',
    question: 'An ambulance siren at 1000 Hz approaches you. What do you hear?',
    options: ['1000 Hz (unchanged)', 'Less than 1000 Hz', 'Greater than 1000 Hz', 'No sound'],
    correctIndex: 2,
    explanation: 'Doppler effect: when source approaches, observed frequency is HIGHER than emitted. When it moves away, frequency is LOWER.',
  ),
  // Circuits
  QuizQuestion(
    chapterId: '6',
    question: 'Three 6Ω resistors are connected in parallel. What is the total resistance?',
    options: ['18 Ω', '6 Ω', '2 Ω', '3 Ω'],
    correctIndex: 2,
    explanation: '1/R = 1/6 + 1/6 + 1/6 = 3/6 = 1/2 → R = 2 Ω. For n identical resistors in parallel: R_total = R/n = 6/3 = 2 Ω.',
  ),
  QuizQuestion(
    chapterId: '6',
    question: 'A 60 W bulb operates on 120 V. What current flows through it?',
    options: ['0.5 A', '2 A', '7200 A', '60 A'],
    correctIndex: 0,
    explanation: 'P = IV → I = P/V = 60/120 = 0.5 A',
  ),
  // Thermal
  QuizQuestion(
    chapterId: '7',
    question: 'How much heat is needed to raise 2 kg of water by 50°C? (c_water = 4200 J/kg°C)',
    options: ['4200 J', '420,000 J', '84,000 J', '210,000 J'],
    correctIndex: 1,
    explanation: 'Q = mcΔT = 2 × 4200 × 50 = 420,000 J',
  ),
  QuizQuestion(
    chapterId: '7',
    question: 'Water boils at 100°C. What is this in Kelvin?',
    options: ['100 K', '273 K', '373 K', '212 K'],
    correctIndex: 2,
    explanation: 'T(K) = T(°C) + 273 = 100 + 273 = 373 K',
  ),
  // Optics
  QuizQuestion(
    chapterId: '8',
    question: 'Light travels from glass (n=1.5) to air (n=1.0). What is the critical angle?',
    options: ['41.8°', '30°', '45°', '60°'],
    correctIndex: 0,
    explanation: 'sinθ_c = n₂/n₁ = 1.0/1.5 = 0.667 → θ_c = arcsin(0.667) = 41.8°',
  ),
  QuizQuestion(
    chapterId: '8',
    question: 'A converging lens has focal length 20 cm. An object is 60 cm away. Where is the image?',
    options: ['30 cm', '60 cm', '40 cm', '15 cm'],
    correctIndex: 0,
    explanation: '1/f = 1/d_o + 1/d_i → 1/20 = 1/60 + 1/d_i → 1/d_i = 1/20 − 1/60 = 2/60 → d_i = 30 cm',
  ),
  // Nuclear
  QuizQuestion(
    chapterId: '9',
    question: 'A radioactive sample has a half-life of 5 years. After 15 years, what fraction remains?',
    options: ['1/2', '1/4', '1/8', '1/16'],
    correctIndex: 2,
    explanation: '15/5 = 3 half-lives. Fraction = (½)³ = 1/8. After 3 half-lives, only 1/8 of the original sample remains.',
  ),
  QuizQuestion(
    chapterId: '9',
    question: 'Which type of radiation is stopped by a thin sheet of paper?',
    options: ['Beta', 'Gamma', 'Alpha', 'X-rays'],
    correctIndex: 2,
    explanation: 'Alpha particles (helium nuclei) are the largest and most ionising but least penetrating — stopped by paper or a few cm of air. Beta needs aluminium; gamma needs thick lead.',
  ),
];

// ═══════════════════════════════════════════════════
// FORMULA SHEET (all key formulas)
// ═══════════════════════════════════════════════════
final Map<String, List<Formula>> formulaSheet = {
  'Kinematics': [
    Formula(name: 'Average velocity', expression: 'v = Δx/Δt', variables: 'm/s'),
    Formula(name: 'Acceleration', expression: 'a = Δv/Δt', variables: 'm/s²'),
    Formula(name: 'v(t)', expression: 'v = v₀ + at', variables: 'constant acceleration'),
    Formula(name: 'x(t)', expression: 'Δx = v₀t + ½at²', variables: 'constant acceleration'),
    Formula(name: 'v²(x)', expression: 'v² = v₀² + 2aΔx', variables: 'no time variable'),
    Formula(name: 'Free fall', expression: 'g = 9.8 m/s²', variables: 'downward'),
  ],
  "Newton's Laws": [
    Formula(name: 'Net force', expression: 'ΣF = ma', variables: 'N, kg, m/s²'),
    Formula(name: 'Weight', expression: 'W = mg', variables: 'N, kg, m/s²'),
    Formula(name: 'Friction', expression: 'f = μN', variables: 'kinetic or static μ'),
  ],
  'Momentum': [
    Formula(name: 'Momentum', expression: 'p = mv', variables: 'kg·m/s'),
    Formula(name: 'Impulse', expression: 'J = FΔt = Δp', variables: 'N·s'),
    Formula(name: 'Conservation', expression: 'p₁ᵢ + p₂ᵢ = p₁f + p₂f', variables: 'closed system'),
  ],
  'Work & Energy': [
    Formula(name: 'Work', expression: 'W = Fd cosθ', variables: 'J'),
    Formula(name: 'Kinetic energy', expression: 'KE = ½mv²', variables: 'J'),
    Formula(name: 'Gravitational PE', expression: 'PE = mgh', variables: 'J'),
    Formula(name: 'Power', expression: 'P = W/t = Fv', variables: 'W = J/s'),
    Formula(name: 'Work-energy thm.', expression: 'W_net = ΔKE', variables: ''),
  ],
  'Waves & Sound': [
    Formula(name: 'Wave speed', expression: 'v = fλ', variables: 'm/s'),
    Formula(name: 'Period', expression: 'T = 1/f', variables: 's'),
    Formula(name: 'Doppler effect', expression: 'f\' = f(v±v_o)/(v∓v_s)', variables: ''),
    Formula(name: 'Decibels', expression: 'β = 10log(I/I₀)', variables: 'I₀ = 10⁻¹² W/m²'),
  ],
  'Electricity': [
    Formula(name: "Ohm's law", expression: 'V = IR', variables: 'V, A, Ω'),
    Formula(name: 'Current', expression: 'I = Q/t', variables: 'A'),
    Formula(name: 'Power', expression: 'P = IV = I²R = V²/R', variables: 'W'),
    Formula(name: 'Series R', expression: 'R = R₁+R₂+R₃', variables: 'Ω'),
    Formula(name: 'Parallel R', expression: '1/R = 1/R₁+1/R₂', variables: 'Ω'),
  ],
  'Thermal Physics': [
    Formula(name: 'Specific heat', expression: 'Q = mcΔT', variables: 'J, kg, J/kg°C, °C'),
    Formula(name: 'Latent heat', expression: 'Q = mL', variables: 'J, kg, J/kg'),
    Formula(name: 'Temp. conversion', expression: 'T(K) = T(°C) + 273', variables: ''),
  ],
  'Optics': [
    Formula(name: "Snell's law", expression: 'n₁sinθ₁ = n₂sinθ₂', variables: ''),
    Formula(name: 'Refractive index', expression: 'n = c/v', variables: ''),
    Formula(name: 'Thin lens', expression: '1/f = 1/d_o + 1/d_i', variables: 'm'),
    Formula(name: 'Magnification', expression: 'm = -d_i/d_o', variables: ''),
    Formula(name: 'Critical angle', expression: 'sinθ_c = n₂/n₁', variables: ''),
  ],
  'Nuclear Physics': [
    Formula(name: 'Radioactive decay', expression: 'N = N₀(½)^(t/t½)', variables: ''),
    Formula(name: 'Mass-energy', expression: 'E = mc²', variables: 'J, kg, m/s'),
  ],
};

// ═══════════════════════════════════════════════════
// PAST PAPER QUESTIONS
// ═══════════════════════════════════════════════════
final List<PastPaperQuestion> pastPaperQuestions = [
  PastPaperQuestion(
    year: '2023',
    topic: 'Kinematics',
    difficulty: 'medium',
    question: 'A car starts from rest and accelerates uniformly at 3 m/s². '
        '(a) Calculate the velocity after 8 seconds.\n'
        '(b) Calculate the distance covered in this time.\n'
        '(c) A second car passes the starting point at the same moment with constant velocity 20 m/s. '
        'When does the first car overtake the second?',
    answer: '(a) v = v₀ + at = 0 + 3×8 = 24 m/s\n\n'
        '(b) Δx = v₀t + ½at² = 0 + ½(3)(64) = 96 m\n\n'
        '(c) Set distances equal:\n'
        'Car 1: x = ½(3)t² = 1.5t²\n'
        'Car 2: x = 20t\n'
        '1.5t² = 20t → t = 20/1.5 = 13.3 s',
  ),
  PastPaperQuestion(
    year: '2023',
    topic: "Newton's Laws",
    difficulty: 'hard',
    question: 'Two masses, m₁ = 4 kg and m₂ = 6 kg, are connected by a light string over a frictionless pulley (Atwood machine).\n'
        '(a) Find the acceleration of the system.\n'
        '(b) Find the tension in the string.\n'
        '(c) If the system starts from rest, how far does m₂ fall in 2 seconds?',
    answer: '(a) Net force = (m₂−m₁)g = 2×9.8 = 19.6 N\n'
        'Total mass = 10 kg\n'
        'a = 19.6/10 = 1.96 m/s²\n\n'
        '(b) For m₁: T − m₁g = m₁a\n'
        'T = m₁(g+a) = 4(9.8+1.96) = 47.0 N\n\n'
        '(c) Δx = ½at² = ½(1.96)(4) = 3.92 m',
  ),
  PastPaperQuestion(
    year: '2022',
    topic: 'Momentum',
    difficulty: 'medium',
    question: 'A ball of mass 0.5 kg moving at 8 m/s collides head-on with a stationary ball of mass 1.5 kg. '
        'After the collision, the first ball moves at 2 m/s in the same direction.\n'
        '(a) Find the velocity of the second ball after the collision.\n'
        '(b) Calculate the kinetic energy before and after. Is the collision elastic?',
    answer: '(a) Conservation of momentum:\n'
        '0.5×8 + 0 = 0.5×2 + 1.5×v₂\n'
        '4 = 1 + 1.5v₂ → v₂ = 2 m/s\n\n'
        '(b) KE_before = ½(0.5)(8²) = 16 J\n'
        'KE_after = ½(0.5)(2²) + ½(1.5)(2²) = 1 + 3 = 4 J\n'
        'KE_before ≠ KE_after → Not elastic (inelastic)\n'
        'KE lost = 12 J (converted to heat/sound/deformation)',
  ),
  PastPaperQuestion(
    year: '2022',
    topic: 'Work & Energy',
    difficulty: 'medium',
    question: 'A 2 kg block slides down a frictionless ramp of height 3 m, then along a horizontal surface with coefficient of kinetic friction μ = 0.4.\n'
        '(a) What is the block\'s speed at the bottom of the ramp?\n'
        '(b) How far does it travel along the horizontal surface before stopping?',
    answer: '(a) Conservation of energy (no friction on ramp):\n'
        'mgh = ½mv² → v = √(2gh) = √(2×9.8×3) = 7.67 m/s\n\n'
        '(b) Work done by friction = change in KE:\n'
        '−μmgd = 0 − ½mv²\n'
        'd = v²/(2μg) = (58.8)/(2×0.4×9.8) = 7.5 m',
  ),
  PastPaperQuestion(
    year: '2021',
    topic: 'Electricity',
    difficulty: 'hard',
    question: 'In a circuit, two resistors R₁ = 4Ω and R₂ = 12Ω are connected in parallel, and this combination is connected in series with R₃ = 2Ω. The battery EMF is 12 V with negligible internal resistance.\n'
        '(a) Find the total resistance.\n'
        '(b) Find the current from the battery.\n'
        '(c) Find the current through R₂.\n'
        '(d) Find the power dissipated in R₃.',
    answer: '(a) R_parallel = (4×12)/(4+12) = 48/16 = 3Ω\n'
        'R_total = 3 + 2 = 5Ω\n\n'
        '(b) I_total = V/R = 12/5 = 2.4 A\n\n'
        '(c) V across parallel = I×R_p = 2.4×3 = 7.2 V\n'
        'I₂ = V/R₂ = 7.2/12 = 0.6 A\n\n'
        '(d) P₃ = I²R₃ = (2.4)²×2 = 11.52 W',
  ),
  PastPaperQuestion(
    year: '2021',
    topic: 'Thermal Physics',
    difficulty: 'medium',
    question: '500 g of water at 20°C is heated to boiling point (100°C) and then completely evaporated. '
        'Given: c_water = 4200 J/kg°C, L_v = 2,260,000 J/kg\n'
        '(a) Energy to heat water to 100°C\n'
        '(b) Energy to evaporate it\n'
        '(c) Total energy',
    answer: '(a) Q₁ = mcΔT = 0.5 × 4200 × 80 = 168,000 J\n\n'
        '(b) Q₂ = mL_v = 0.5 × 2,260,000 = 1,130,000 J\n\n'
        '(c) Q_total = 168,000 + 1,130,000 = 1,298,000 J ≈ 1.3 MJ\n\n'
        'Note: far more energy needed to evaporate than heat — that is why sweating cools you so effectively.',
  ),
  PastPaperQuestion(
    year: '2020',
    topic: 'Waves',
    difficulty: 'easy',
    question: 'A sound wave has a frequency of 440 Hz (musical note A). The speed of sound in air is 340 m/s.\n'
        '(a) Calculate the wavelength.\n'
        '(b) Calculate the period.\n'
        '(c) Another sound has wavelength 0.5 m. Is its frequency higher or lower than 440 Hz?',
    answer: '(a) λ = v/f = 340/440 = 0.773 m\n\n'
        '(b) T = 1/f = 1/440 = 0.00227 s (2.27 ms)\n\n'
        '(c) f = v/λ = 340/0.5 = 680 Hz — HIGHER than 440 Hz\n'
        '(Shorter wavelength → higher frequency for same wave speed)',
  ),
  PastPaperQuestion(
    year: '2020',
    topic: 'Nuclear Physics',
    difficulty: 'medium',
    question: 'Carbon-14 has a half-life of 5,730 years. A sample of wood from an ancient tree contains 25% of the ¹⁴C found in living wood.\n'
        '(a) How many half-lives have elapsed?\n'
        '(b) How old is the wood sample?',
    answer: '(a) 25% = ¼ = (½)² → 2 half-lives have elapsed\n\n'
        '(b) Age = 2 × 5,730 = 11,460 years\n\n'
        'This is the principle of radiocarbon dating — comparing ¹⁴C in a sample to the atmospheric ¹⁴C concentration allows dating of organic materials up to ~50,000 years old.',
  ),
];
