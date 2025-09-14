namespace Balatro.Cards

open Microsoft.Xna.Framework
open Microsoft.Xna.Framework.Graphics

type SpectralEdition() =
    inherit CardEdition("Spectral", Color.White)

    override this.DrawOverlay(spriteBatch: SpriteBatch, card: Card, position: Vector2, scale: float32) =
        // base drawing first
        base.DrawOverlay(spriteBatch, card, position, scale)

        // apply a subtle shine/glint effect
        let shineColor = Color(180, 255, 255, 160) // soft cyan glow
        let shineOffset = Vector2(0.f, -4.f * scale)

        spriteBatch.Draw(
            texture = Shaders.GlintTexture,   // hypothetical glint asset
            position = position + shineOffset,
            sourceRectangle = Nullable(),
            color = shineColor,
            rotation = 0.f,
            origin = Vector2.Zero,
            scale = Vector2(scale, scale),
            effects = SpriteEffects.None,
            layerDepth = 0.9f
        )

    override this.OnApply(card: Card) =
        // could add passive effects if needed
        ()
